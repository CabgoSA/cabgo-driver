import 'dart:async';
import 'dart:convert';
import 'package:cabgo_driver/services/local_notification_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cabgo_driver/request/user.dart';
import 'package:cabgo_driver/request/google_maps_request.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../exceptions/locationErrors.dart';
import '../request/device_info.dart';
import '../request/directions_model.dart';
import '../request/ride.dart';
import '../request/secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class AppState with ChangeNotifier {
  //

  //AUTH
  //LOGIN CONTOLLER
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Driver driver;

  PermissionStatus pushPermission;
  PermissionStatus storagePermission;

  //REGISTER CONTROLLER
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerFirstNameController = TextEditingController();
  TextEditingController registerLastNameController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();
  TextEditingController locationController = TextEditingController();

  //verify
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  TextEditingController textController5 = TextEditingController();

  //reset password
  TextEditingController resetPhoneNumber = TextEditingController();

  //new password
  TextEditingController newPassword = TextEditingController();
  TextEditingController newPasswordConfirm = TextEditingController();

  TextEditingController reasonController = TextEditingController();

  bool registerTermsAndConditionsValue = false;

  int userId;

  String userRegisterPhone;

  //TOKENS
  String _accessToken;

  //String accessToken;
  String get accessToken => _accessToken;

  bool _isLoggedIn = false;
  bool _isOnline = false;
  bool incomeMessage = false;

  bool get isOnline => _isOnline;
  bool get isLoggedIn => _isLoggedIn;
  //END AUTH

  //LOCATION SERVICE
  static LatLng _initialPosition;
  LatLng _lastPosition = _initialPosition;
  bool locationServiceActive = true;

  //LOCATION SETTINGS
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  //GOOGLE MAPS
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  GoogleMapController _mapController;

  //Visibility variables

  bool onlineVisibility = true;
  bool pickupVisibility = false;
  bool dropoffVisibility = false;
  bool ratingsVisibility = false;
  bool invoiceVisibility = false;
  double dragableSize = 0.2;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  //GO ONLINE ICONS

  Icon forwardIcon = Icon(
    Icons.arrow_forward_ios_rounded,
    color: Colors.white,
    size: 30,
  );
  Icon backIcon = Icon(
    Icons.arrow_forward_ios_rounded,
    color: Colors.white,
    size: 30,
  );
  Icon slideIcon = Icon(
    Icons.arrow_forward_ios_rounded,
    color: Colors.white,
    size: 30,
  );

  LatLng get initialPosition => _initialPosition;
  LatLng get lastPosition => _lastPosition;
  GoogleMapsServices get googleMapsServices => _googleMapsServices;
  GoogleMapController get mapController => _mapController;

  // chat height
  double chatHeight = 1.5;
  //push notifications
  FirebaseMessaging _messaging;
  PushNotifications notifications;

  //route users
  RideRoute _info;
  RideRoute get info => _info; //GETTERS
  RiderDetails _riderDetails;
  RiderDetails get riderDetails => _riderDetails;
  RouteDriver _routeDriver;
  RouteDriver get routeDriver => _routeDriver;

  //past ride
  List pastTrips;
  List upcomingTrips;

  Map<String, dynamic> earnings;

  //  device information
  String _providerID;
  String _fcmToken;
  String _deviceType;
  String _deviceID;

  AppState() {
    _getUserLocation();
    _isUserLogged();
    _loadingInitialPosition();
    _registerNotification();
    _getDeviceData();
  }

//    register notification
  void _registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _fcmToken = await FirebaseMessaging.instance.getToken();
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      //get ride details
      Response data = await ApiClient()
          .fetchRideDetails(message.data['requestID'], _accessToken);
      Map<String, dynamic> rideData = jsonDecode(data.toString());
      if (rideData != null) {
        //create notification
        notifications = PushNotifications(
            message.data['message'], message.data['requestID']);
        _riderDetails = RiderDetails(
          fullName: rideData['user']['first_name'] +
              ' ' +
              rideData['user']['last_name'],
          picture: rideData['user']['picture'],
          phone: rideData['user']['mobile'],
          rating: rideData['user']['rating'],
          price: (double.parse(rideData['service_type']['price']) *
                  double.parse(rideData['distance']))
              .toString(),
          riderLocation: LatLng(double.parse(rideData['s_latitude']),
              double.parse(rideData['s_longitude'])),
        );
        incomeMessage = true;
        notifyListeners();
      } else {
        throw IncomingRequestError();
      }
    });
  }

//  get user Location of Device
  Future<void> _getUserLocation() async {
    //start
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    try {
      if (!serviceEnabled) {
        throw LocationServiceDisabled();
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw LocationServiceDenied();
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        throw LocationDeniedForever();
      }
      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      Geolocator.getPositionStream(locationSettings: locationSettings)
          .listen((Position position) {
        _initialPosition = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      throw GeneralError();
    }

    notifyListeners();
  }

  //map details
  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  // ON CAMERA MOVE
  void onCameraMove(CameraPosition position) {
    _lastPosition = position.target;
    notifyListeners();
  }

  //device info
  void _getDeviceData() async {
    try {
      await DeviceInfo.getDeviceDetails().then((value) {
        _deviceID = value[0];
        _deviceType = value[1];
      });
    } catch (e) {}
  }

  //user Auth

  //check is user loggedin
  Future<void> _isUserLogged() async {
    try {
      await GetTokenLocalStorage().readStorage('access_token').then((value) {
        _isLoggedIn = (accessToken != null) ? true : false;
        notifyListeners();
      });
    } catch (e) {
      throw GettingTokenError();
    }
  }

  // ! SEND REQUEST
  Future<void> login() async {
    try {
      final response = await ApiClient().login(
          phoneController.text,
          passwordController.text,
          _fcmToken,
          _deviceType,
          _deviceID,
          _initialPosition.latitude,
          _initialPosition.longitude);

      _accessToken = response['access_token'];
      _providerID = response['id'].toString();
      driver = Driver(
          fullName: response['first_name'] + ' ' + response['last_name'],
          phone: response['mobile'],
          email: response['email'],
          picture: response['avatar'],
          rating: double.parse(response['rating']));
      _isLoggedIn = true;
      _isOnline = false;

      await ApiClient().setFcmToken(_accessToken, _fcmToken);

      notifyListeners();
    } on InvalidCridetials {
      throw InvalidCridetials();
    } catch (e) {
      throw GeneralError();
    }
  }

  // ! SEND REQUEST

  Future<void> register() async {
    try {
      dynamic response = await ApiClient().registerUser(
          registerEmailController.value.text,
          registerFirstNameController.value.text,
          registerLastNameController.value.text,
          registerPhoneController.value.text,
          registerPasswordController.value.text,
          registerConfirmPasswordController.value.text,
          _fcmToken,
          _deviceType,
          _deviceID);
      if (response != null) {
        userRegisterPhone = response['mobile'];
        registerEmailController.clear();
        registerFirstNameController.clear();
        registerLastNameController.clear();
        registerPhoneController.clear();
        registerPasswordController.clear();
        registerConfirmPasswordController.clear();
        notifyListeners();
      } else {
        throw UserNotRegistered();
      }
    } catch (e) {
      throw UserNotRegistered();
    }
  }

  Future<void> verifyOtpPasswordReset() async {
    try {
      String otpCode = textController1.text;
      otpCode += textController2.text;
      otpCode += textController3.text;
      otpCode += textController4.text;
      otpCode += textController5.text;

      await ApiClient().verifyOtpPasswordReset(
        resetPhoneNumber.text,
        otpCode,
      );

      textController1.clear();
      textController2.clear();
      textController3.clear();
      textController4.clear();
      textController5.clear();
      notifyListeners();
    } catch (e) {
      throw OtpVerificationError();
    }
  }

  Future<void> logout() async {
    try {
      await ApiClient().logOut(_accessToken);
      _accessToken = null;
      _isOnline = false;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> requestResetOtp() async {
    try {
      await ApiClient().requestResetOtp(resetPhoneNumber.text);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> passwordReset() async {
    try {
      dynamic data = await ApiClient().passwordReset(
          resetPhoneNumber.text, newPassword.text, newPasswordConfirm.text);
      return data;
    } catch (_) {}
  }

  // ! SEND REQUEST
  Future<void> goOnline(String status) async {
    dynamic response = await ApiClient().goOnline(status, _accessToken);

    if (response['service']['status'] == 'active') {
      _isOnline = true;
      slideIcon = backIcon;
      notifyListeners();
    } else {
      _isOnline = false;
      slideIcon = forwardIcon;
      notifyListeners();
    }
  }

  Future<void> delete() async {
    await ApiClient().delete(_accessToken);
  }

  void uploadDocument(int documentId) async {
    String endPoint =
        dotenv.get('BASE_URL') + 'api/provider/profile/documents/store';
    // get file
    var file;
    file = await ImagePicker().pickImage(source: ImageSource.gallery);

    file = File(file.path);
    String fileName = file.path.split('/').last;
    FormData data = FormData.fromMap({
      "id": documentId,
      "document": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();
    String token = _accessToken;
    dio.options.headers["Authorization"] = 'Bearer $token';
    dio.post(endPoint, data: data).then((response) {
      jsonDecode(response.toString());
    }).catchError((error) => print(error));
  }

  //  Dashboard Map
  //  LOADING INITIAL POSITION
  void _loadingInitialPosition() async {
    await Future.delayed(Duration(seconds: 5)).then((v) {
      if (_initialPosition == null) {
        locationServiceActive = false;
        notifyListeners();
      }
    });

    pushPermission = await Permission.notification.request();
    storagePermission = await Permission.storage.request();
  }

  Future<void> acceptRequest(int requestID) async {
    dynamic rideDetails = await Ride().acceptRide(requestID, _accessToken);

    _info = RideRoute(
      bookingID: (rideDetails['id']).toString(),
      paymentMethod: rideDetails['payment_mode'],
      serviceType: rideDetails['service_type_id'],
      totalDistance: rideDetails['distance'],
      price: 3,
      otp: rideDetails['otp'],
      driverLocation: initialPosition,
      riderLocation: LatLng(double.parse(rideDetails['s_latitude']),
          double.parse(rideDetails['s_longitude'])),
      riderDestination: LatLng(double.parse(rideDetails['d_latitude']),
          double.parse(rideDetails['d_longitude'])),
      route: rideDetails['route_key'],
    );

    await driveToPick();

    notifyListeners();
  }

  Future<void> driveToPick() async {
    Directions details =
        await Ride().driveToPickUp(initialPosition, _info.riderLocation);

    _routeDriver = RouteDriver(
        markerSource: initialPosition,
        markerDestination: _info.riderLocation,
        polypoints: details.polylinePoints);

    notifyListeners();
  }

  Future<void> callDriver() async {
    try {
      await Ride().callDriver(_accessToken, driver.phone, _riderDetails.phone);
    } catch (e) {
      throw ErrorCallingDriver;
    }
  }

  Future<void> cancelRide() async {
    try {
      await Ride()
          .cancelRide(_accessToken, _info.bookingID, reasonController.text);
      _info = null;
      _routeDriver = null;
      notifications = null;

      //Visibility variables
      onlineVisibility = true;
      pickupVisibility = false;
      dropoffVisibility = false;
      ratingsVisibility = false;
      invoiceVisibility = false;
      dragableSize = 0.2;
    } catch (e) {
      throw ErrorCancelingRide;
    }
  }

  Future<void> driveToRiderDestination() async {
    List<PointLatLng> polylinePoints =
        PolylinePoints().decodePolyline(info.route);
    _routeDriver = RouteDriver(
        markerSource: info.riderLocation,
        markerDestination: info.riderLocation,
        polypoints: polylinePoints);
    //update database
    updateRide(int.parse(_info.bookingID), 'PICKEDUP');
    notifyListeners();
  }

  Future<void> dropRider() async {
    //update database
    await updateRide(int.parse(_info.bookingID), 'COMPLETED');
    _routeDriver = null;
    notifyListeners();
  }

  Future<void> updateRide(int requestID, String tripStatus) async {
    await Ride().updateRide(_accessToken, requestID, tripStatus);
    notifyListeners();
  }

  Future<void> rateRide(int rating, String comment) async {
    try {
      List<String> status = await Ride()
          .rateRide(_accessToken, int.parse(_info.bookingID), rating, comment);
      notifyListeners();
    } catch (e) {
      throw ErrorRatingRide;
    }
  }

  Future<void> historyTrips() async {
    pastTrips = await Ride().historyTrips(_accessToken);
    notifyListeners();
  }

  Future<void> scheduledTrips() async {
    upcomingTrips = await Ride().upcomingTrips(_accessToken);
    notifyListeners();
  }

  Future<Map<String, dynamic>> summary() async {
    try {
      earnings = await Ride().summary(_accessToken);
      return earnings;
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void changeHeight(double height) {
    chatHeight = height;
    notifyListeners();
  }

  SnackBar SnackBarCaller(String message) {
    return SnackBar(
      content: Text(message),
    );
  }

  Future<void> verifyOtp() async {
    try {
      String otpCode = textController1.text;
      otpCode += textController2.text;
      otpCode += textController3.text;
      otpCode += textController4.text;
      otpCode += textController5.text;
      await ApiClient().verifyOtp(
        userRegisterPhone,
        otpCode,
      );

      clearController();
    } catch (e) {
      throw OtpVerificationError();
    }
  }

  void clearController() {
    textController1.clear();
    textController2.clear();
    textController3.clear();
    textController4.clear();
    textController5.clear();
    notifyListeners();
  }
}
