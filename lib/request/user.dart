import 'package:cabgo_driver/flutter_flow/flutter_flow_util.dart';
import 'package:cabgo_driver/request/ride.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';




class ApiClient {
  final Dio _dio = Dio();
  String accessToken = 'Bearer  eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI0OCwiaXNzIjoiaHR0cHM6Ly9jYWJnby5jby56YS9hcGkvcHJvdmlkZXIvb2F1dGgvdG9rZW4iLCJpYXQiOjE2NTY2ODA5ODksImV4cCI6MTY1NzA0MDk4OSwibmJmIjoxNjU2NjgwOTg5LCJqdGkiOiJVallRVXQ4WHBoRWdMS3o4In0.1hS_WjRP2OipmrrQb8n6Y0yenHEz3pdBYmyBI8NwVy4';
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
    _dio.options.headers["Authorization"] = accessToken;
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/profile/available',
        data: {
          'service_status': status,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      print(response);
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<Response> fetchRideDetails(String requestID) async {

    int id = int.parse(requestID);

    _dio.options.headers["Authorization"] = accessToken;
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