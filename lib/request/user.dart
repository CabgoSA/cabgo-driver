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

      print(response);
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
          'mobile': '+27$phone',
          'otp': otp
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      print(response);
      return;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> passwordReset(String phone, String newPassword, newPasswordConfirm) async {
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/reset/password',
        data: {
          'mobile': '+27$phone',
          'password': newPassword,
          'password_confirmation': newPasswordConfirm,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      print(response);
      return;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> resetPassword(String password, String passwordConfirmation ,int id) async {
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/verify/otp',
        data: {
          'password': password,
          'password_confirmation': passwordConfirmation,
          'id' : id,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> requestResetOtp(String phone) async {
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/forgot/password' ,
        data : {
          'mobile': '+27$phone',
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );
      print(response);
    } on DioError catch (e) {
      return e.response.data;
    }
  }



  Future<dynamic> login(String phone, String password, String fcmToken, String deviceType, String deviceID) async {

    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/oauth/token',
        data: {
          'mobile': '+27$phone',
          'password': password,
          'grant_type': 'password',
          'device_type': deviceType,
          'device_token': fcmToken,
          'device_id': deviceID
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );


      return response.data;

    } on DioError catch (e) {
      throw InvalidCridetials();
    }
  }

  Future<dynamic> logOut(String providerID) async {

    try {

       Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/logout',
        data: {
          'id': providerID,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

       print(response);

      return response;
    }on DioError catch(e) {
     print(e);
    } catch(e){
      print(e);
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