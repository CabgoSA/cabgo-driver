import 'package:cabgo_driver/flutter_flow/flutter_flow_util.dart';
import 'package:cabgo_driver/request/ride.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../exceptions/locationErrors.dart';
import '../request/secure_storage.dart';




class ApiClient {
  final Dio _dio = Dio();
  String _accessToken;
  String _providerID;
  String _fcmToken;
  String _deviceType;
  String _deviceID;

  ApiClient(){
    getLocalData();
  }
  void getLocalData()  async{
     GetTokenLocalStorage()
        .readStorage('access_token')
        .then((value) {

      _accessToken = 'Bearer $value';
    });
     GetTokenLocalStorage().readStorage('provider_id').then((value) {
      _providerID = value;
    });
     GetTokenLocalStorage().readStorage('fcm_token').then((value) {
      _fcmToken = value;
    });
     GetTokenLocalStorage().readStorage('device_type').then((value) {
      _deviceType = value;
    });

     GetTokenLocalStorage().readStorage('device_id').then((value) {
      _deviceID = value;
    });
  }
  Future<dynamic> registerUser(String email, String firstName,  String lastName,  String phone,  String password,  String confirmPassword ) async {
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/register' ,
        data : {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
          'device_token': _fcmToken,
          'mobile': '+27'+phone,
          'dial_code': '0027',
          'device_type': _deviceType,
          'login_by': 'manual',
          'device_id': _deviceID
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      return response.data;


    } on DioError catch (e) {
      if(e.response.data['email']){
        return e.response.data;

      }

    }
  }

  Future<dynamic> otp(String phone) async {
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/user/otp' ,
        data : {
          'mobile': phone,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }



  Future<dynamic> login(String email, String password) async {

    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/oauth/token',
        data: {
          'email': email,
          'password': password,
          'grant_type': 'password',
          'device_type': _deviceType,
          'device_token': _fcmToken,
          'device_id': _deviceID
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      print(response);

      if(response == null) {
        if (response.data != null) {
          return response.data;
        } else {
          throw InvalidCridetials();
        }
      }else{
        throw GeneralError();
      }
    } on DioError catch (e) {
      print(e.response);
    } catch(e){
      throw GeneralError();
    }
  }

  Future<void> logOut() async {

    try {

       await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/logout',
        data: {
          'id': _providerID,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

    } on  LogoutError{

      print('Error Loging out');

    } on DioError  {

      print('Error with network out');
    } catch(e){
      print(e);
    }
  }

  Future<dynamic> goOnline(String status) async {
    _dio.options.headers["Authorization"] = _accessToken;
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/profile/available',
        data: {
          'service_status': status,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<Response> fetchRideDetails(String requestID) async {

    int id = int.parse(requestID);

    _dio.options.headers["Authorization"] = _accessToken;
    try {
      var response = await _dio.get(
          dotenv.get('BASE_URL') + 'api/provider/trip/details/$id'
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

   bool youHaveArrived(LatLng currentLocation, LatLng destinationLocation){

    if(currentLocation.latitude == destinationLocation.latitude && currentLocation.longitude == destinationLocation.longitude ){
      return true;
    }

    return false;
  }


  void callRider(RiderDetails phone){

  }

  void chatRider(RiderDetails riderID, String message){

  }

  double tripInvoice(double distance, int   serviceTypePrice){

    return distance * serviceTypePrice;
  }




}