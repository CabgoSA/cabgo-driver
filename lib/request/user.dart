import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';




class ApiClient {
  final Dio _dio = Dio();
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
          'device_token': 'e6AH-mhp_0I:APA91bFyRFlzohXy7wLP0TwvIKMg3RzZG1UhaAVkljUu3_J84bgllg1wQQqkklK1v1LxLjx0P0Krz0XeajW4-750p6tq3nm0vjknGjQ3rJOvY-ATeeVxU3BX_zzF5Ip9p66IzcB0BngL',
          'mobile': '+27'+phone,
          'dial_code': '0027',
          'device_type': 'android',
          'login_by': 'manual',
          'device_id': 'bbf811a3d948e70a'
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
          'client_secret': 'bSB7ha4gWUFG6IZCNdxBHVwoAh1W87ZUtBVSKBjd',
          'client_id': '2',
          'device_type': 'android',
          'device_token': 'e6AH-mhp_0I:APA91bFyRFlzohXy7wLP0TwvIKMg3RzZG1UhaAVkljUu3_J84bgllg1wQQqkklK1v1LxLjx0P0Krz0XeajW4-750p6tq3nm0vjknGjQ3rJOvY-ATeeVxU3BX_zzF5Ip9p66IzcB0BngL',
          'device_id': 'bbf811a3d948e70a'
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> goOnline(String status) async {
    String accessToken = 'Bearer  eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI0OCwiaXNzIjoiaHR0cHM6Ly9jYWJnby5jby56YS9hcGkvcHJvdmlkZXIvb2F1dGgvdG9rZW4iLCJpYXQiOjE2NTU0NjE3NjMsImV4cCI6MTY1NTgyMTc2MywibmJmIjoxNjU1NDYxNzYzLCJqdGkiOiJhRmpCQXdqUkl2R0dCb0F2In0.zGXjVbplvT4iFkHvIc3ql9WaCCDWokNawE0Qi4XKb5o';
    _dio.options.headers["Authorization"] = accessToken;
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






}