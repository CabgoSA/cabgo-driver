import 'package:cabgo_driver/flutter_flow/flutter_flow_util.dart';
import 'package:cabgo_driver/request/ride.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../exceptions/locationErrors.dart';
import '../request/secure_storage.dart';
import 'package:flutter/foundation.dart';




class ApiClient {
  final Dio _dio = Dio();


  // ApiClient(){
  //   getLocalData();
  // }
  // void getLocalData()  async{
  //    GetTokenLocalStorage()
  //       .readStorage('access_token')
  //       .then((value) {
  //     _accessToken = 'Bearer $value';
  //   });
  //    GetTokenLocalStorage().readStorage('provider_id').then((value) {
  //     _providerID = value;
  //   });
  //    GetTokenLocalStorage().readStorage('fcm_token').then((value) {
  //     _fcmToken = value;
  //   });
  //    GetTokenLocalStorage().readStorage('device_type').then((value) {
  //     _deviceType = value;
  //   });
  //
  //    GetTokenLocalStorage().readStorage('device_id').then((value) {
  //     _deviceID = value;
  //   });
  // }


  Future<dynamic> registerUser(String email, String firstName,  String lastName,  String phone,  String password,  String confirmPassword,String fcmToken,String deviceType,String deviceID) async {
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/register' ,
        data : {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
          'device_token': fcmToken,
          'mobile': '+27'+phone,
          'dial_code': '0027',
          'device_type': deviceType,
          'login_by': 'manual',
          'device_id': deviceID
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      return response.data;


    } on DioError catch (e) {

        return 'error';

    }
  }



  Future<dynamic> verifyOtp(String phone, String otp) async {
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/verify/otp',
        data: {
          'mobile': '+27$phone',
          'otp': otp
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      return;
    } on DioError catch (e) {
      return e.response.data;
    }

  }

  Future<dynamic> verifyOtpPasswordReset(String phone, String otp) async {
    try {

      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/verify/otp/password',
        data: {
          'mobile': phone,
          'otp': otp,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      return;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> passwordReset(String phone, String newPassword, newPasswordConfirm) async {
    try {
      String mobile = int.parse(phone).toString();
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/reset/password',
        data: {
          'mobile': '+27$mobile',
          'password': newPassword,
          'password_confirmation': newPasswordConfirm,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      return;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> resetPassword(String password, String passwordConfirmation ,int id) async {
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/verify/otp/password',
        data: {
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<void> requestResetOtp(String phone) async {
    try {
      String mobile = int.parse(phone).toString();
      await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/forgot/password' ,
        data : {
          'mobile': '+27$mobile',
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

    } on DioError catch (e) {
      throw ErrorResetingPassword;
    }
  }



  Future<dynamic> login(String phone, String password, String fcmToken, String deviceType, String deviceID, double lat , double long) async {

    try {
      String mobile = int.parse(phone).toString();
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/oauth/token',
        data: {
          'mobile': '+27$mobile',
          'password': password,
          'grant_type': 'password',
          'device_type': deviceType,
          'device_token': fcmToken,
          'device_id': deviceID,
          'latitude' : lat,
          'longitude' : long,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );


      return response.data;

    } on DioError catch (e) {
      throw InvalidCridetials();
    }
  }

  Future<void> setFcmToken(String accessToken,String token) async{
    try{
      _dio.options.headers["Authorization"] = 'Bearer $accessToken';
      _dio.options.headers['content-Type'] = 'application/json';
      Response response = await _dio.get(
        dotenv.get('BASE_URL') + 'api/provider/setFcmToken/$token',
        options: Options(headers: {'Accept': 'application/json'}),
      );

    }catch(e){

    }
  }

  Future<dynamic> logOut(String providerID) async {

    try {

       Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/logout',

        options: Options(headers: {'Accept': 'application/json'}),
      );

      return response;

    } catch(e){
      throw LogoutError();
    }
  }

  Future<dynamic> delete(String accessToken) async {

    try {
       _dio.options.headers["Authorization"] = 'Bearer $accessToken';
       Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/delete',

        options: Options(headers: {'Accept': 'application/json'}),
      );

      return response;

    } catch(e){
      
    }
  }

  Future<dynamic> goOnline(String status, String accessToken) async {

    _dio.options.headers["Authorization"] = 'Bearer $accessToken';
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



  Future<Response> fetchRideDetails(String requestID,String accessToken) async {

    int id = int.parse(requestID);

    _dio.options.headers["Authorization"] = 'Bearer $accessToken';
    try {
      var response = await _dio.get(
          dotenv.get('BASE_URL') + 'api/provider/trip/details/$id'
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }




  void callRider(RiderDetails phone){

  }

  void chatRider(RiderDetails riderID, String message){

  }

  double tripInvoice(double distance, int   serviceTypePrice){

    return distance * serviceTypePrice;
  }




}

class Driver{
  final String fullName;
  final String phone;
  final String email;
  final String picture;
  final double rating;
 const Driver({
               @required this.fullName,
               @required this.phone,
               @required this.email,
               @required this.picture,
               @required this.rating,
              });
}