import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cabgo_driver/request/user.dart';
import 'package:cabgo_driver/request/google_maps_request.dart';


class AppState with ChangeNotifier {


  //LOGIN CONTOLLER
    TextEditingController emailAddressController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    //REGISTER CONTROLLER
    TextEditingController registerEmailController = TextEditingController();
    TextEditingController registerFirstNameController = TextEditingController();
    TextEditingController registerLastNameController = TextEditingController();
    TextEditingController registerPhoneController = TextEditingController(
        text: '+27');
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

    bool get isLoggedIn => _isLoggedIn;

    //String _refreshToken;
    String get accessToken => _accessToken;
    LatLng get initialPosition => _initialPosition;
    LatLng get lastPosition => _lastPosition;
    GoogleMapsServices get googleMapsServices => _googleMapsServices;
    GoogleMapController get mapController => _mapController;
    //String get refreshToken => _refreshToken;



    AppState() {
      _getUserLocation();
      _getTokens();
      isUserLogged();
      _loadingInitialPosition();
    }

//  get user Location of Device
  void _getUserLocation() async {
      print('testetetet location');
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
      print(response);
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
      int userId = await readSecureData('user_id');
      //await _storage.delete(key: 'access_token', aOptions: _getAndroidOptions());
      //await _storage.delete(key: 'user_id', aOptions: _getAndroidOptions());
      isUserLogged();
      print(userId);
      print('------------------loggged out------------------');
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


}


