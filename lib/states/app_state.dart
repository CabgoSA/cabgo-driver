import 'dart:convert';

import 'package:cabgo_driver/services/local_notification_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cabgo_driver/request/user.dart';
import 'package:cabgo_driver/request/google_maps_request.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../request/directions_model.dart';
import '../request/ride.dart';



class AppState with ChangeNotifier {


  //LOGIN CONTOLLER
    TextEditingController emailAddressController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    //REGISTER CONTROLLER
    TextEditingController registerEmailController = TextEditingController();
    TextEditingController registerFirstNameController = TextEditingController();
    TextEditingController registerLastNameController = TextEditingController();
    TextEditingController registerPhoneController = TextEditingController();
    TextEditingController registerPasswordController = TextEditingController();
    TextEditingController registerConfirmPasswordController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    static LatLng _initialPosition;
    bool registerTermsAndConditionsValue = false;
    LatLng _lastPosition = _initialPosition;
    bool locationServiceActive = true;
    String _accessToken;
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    GoogleMapsServices  _googleMapsServices = GoogleMapsServices();
    GoogleMapController _mapController;

    final scaffoldKey = GlobalKey<ScaffoldState>();

    //local storage
    final _storage = const FlutterSecureStorage();

    AndroidOptions _getAndroidOptions() =>
        const AndroidOptions(
          encryptedSharedPreferences: true,
        );

    bool _isLoggedIn = false;
    bool _isOnline = false;
    bool incomeMessage = false;

    bool get isOnline => _isOnline;

    bool get isLoggedIn => _isLoggedIn;

    //String _refreshToken;
    String get accessToken => _accessToken;
    LatLng get initialPosition => _initialPosition;
    LatLng get lastPosition => _lastPosition;
    GoogleMapsServices get googleMapsServices => _googleMapsServices;
    GoogleMapController get mapController => _mapController;
     FirebaseMessaging _messaging;
    PushNotifications notifications;

    RideRoute _info;
    RideRoute get info => _info; //GETTERS

    RiderDetails _riderDetails;
    RiderDetails get riderDetails => _riderDetails;

    List<PointLatLng> _pickRider;

    List<PointLatLng> get pickRider => _pickRider;

  AppState() {
      _getUserLocation();
      _getTokens();
      isUserLogged();
      _loadingInitialPosition();
      _registerNotification();

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
      print('User granted permision ');

    }


    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      //get ride details
      Response data =  await ApiClient().fetchRideDetails(message.data['requestID']);
      Map<String, dynamic> rideData = jsonDecode(data.toString());

      //create notification
     notifications =   PushNotifications(message.data['message'], message.data['requestID']);
     _riderDetails  = RiderDetails(fullName:  rideData['user']['first_name']+ ' '+ rideData['user']['last_name'],
                                    picture: rideData['user']['picture'],
                                    rating : rideData['user']['rating'],
                                    price: 'R340',
                                    riderLocation: LatLng(double.parse(rideData['s_latitude']),double.parse(rideData['s_longitude'])),
                                 );



     incomeMessage = true;
      notifyListeners();
    });
  }



//  get user Location of Device
  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.high);
    _initialPosition = LatLng(position.latitude, position.longitude);
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

    //user Auth
    //get user token
    void _getTokens() async {
      _accessToken = await readSecureData('access_token');
    }

    //check is user loggedin
    bool isUserLogged() {
      _isLoggedIn = (accessToken != null ) ? true : false;
      return _isLoggedIn;
    }

    // ! SEND REQUEST
    Future<void> login() async {
      final response = await ApiClient().login(emailAddressController.text,passwordController.text );
      print(response['access_token']);
      _addNewItem('access_token', response['access_token']);
      _addNewItem('user_id', response['id']);
      if(response['access_token'] != null){
        _isLoggedIn = true;
      }
      notifyListeners();

    }

    // ! SEND REQUEST

    void register() async {
      final response = await ApiClient().registerUser(
        registerEmailController.value.text,
        registerFirstNameController.value.text,
        registerLastNameController.value.text,
        registerPhoneController.value.text,
        registerPasswordController.value.text,
        registerConfirmPasswordController.value.text,
      );
      print(response);
    }


    // ! SEND REQUEST
    Future<void> logout() async {
      await _storage.delete(key: 'access_token', aOptions: _getAndroidOptions());
      isUserLogged();
      notifyListeners();
    }

  // ! SEND REQUEST
  Future<void> goOnline(String status) async {
      dynamic response =  await ApiClient().goOnline(status);
     // print(response);
      if(response['service']['status'] == 'active'){
        _isOnline = true;
      } else {
        _isOnline = false;
      }
    notifyListeners();
  }

    Future<dynamic> readSecureData(String key) async {
      var readData = await _storage.read(key: key, aOptions: _getAndroidOptions());
      return readData;
    }




    void _addNewItem(String key, dynamic value) async {
      await _storage.write(
        key: key,
        value: value,
        aOptions: _getAndroidOptions(),
      );
    }



  //  Dashboard Map
  //  LOADING INITIAL POSITION
    void _loadingInitialPosition()async{
      await Future.delayed(Duration(seconds: 5)).then((v) {
        if(_initialPosition == null){
          locationServiceActive = false;
          notifyListeners();
        }
      });


    }

  Future<void>acceptRequest(int requestID) async{

      dynamic rideDetails = await Ride().acceptRide(requestID);

     _info =  RideRoute(bookingID: rideDetails['booking_id'],
                       paymentMethod: rideDetails['payment_mode'],
                       serviceType:  rideDetails['service_type_id'],
                      totalDistance: rideDetails['distance'],
                      price : 3,
                      otp : rideDetails['otp'],
                      driverLocation: initialPosition,
                      riderLocation: LatLng(double.parse(rideDetails['s_latitude']), double.parse(rideDetails['s_longitude'])),
                      route:  rideDetails['route_key'],
      );
     


     notifyListeners();

  }

  Future<void>request(int requestID) async{

    dynamic rideDetails = await Ride().acceptRide(requestID);

    _info =  RideRoute(bookingID: rideDetails['booking_id'],
      paymentMethod: rideDetails['payment_mode'],
      serviceType:  rideDetails['service_type_id'],
      totalDistance: rideDetails['distance'],
      price : 3,
      otp : rideDetails['otp'],
      driverLocation: initialPosition,
      riderLocation: LatLng(double.parse(rideDetails['s_latitude']), double.parse(rideDetails['s_longitude'])),
      route:  rideDetails['route_key'],
    );



    notifyListeners();

  }

  Future<void> driveToPick(LatLng destination) async{

    Directions details = await Ride().driveToPickUp( initialPosition , destination);

    _pickRider =  details.polylinePoints;

    notifyListeners();

  }


}


