import 'package:cabgo_driver/request/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../exceptions/locationErrors.dart';
import 'directions_model.dart';




class Ride {
  String _accessToken;
  Ride(){
    GetTokenLocalStorage().readStorage('access_token').then((value){
       _accessToken =  'Bearer $value';
    });
  }
  final Dio _dio = Dio();
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  Future<dynamic> acceptRide(int requestID, String accessToken) async {
    _dio.options.headers["Authorization"] = 'Bearer  $accessToken';
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/trip/$requestID' ,
        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      throw e.response.data;
    }
  }

  Future<dynamic> driveToPickUp(LatLng origin, LatLng destination) async{

    final response = await _dio.get(
    _baseUrl,
    queryParameters: {
    'origin': '${origin.latitude},${origin.longitude}',
    'destination': '${destination.latitude},${destination.longitude}',
    'key': dotenv.get('API_KEY'),
    },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
    return Directions.fromMap(response.data);
    }
    return null;
    }

  Future<dynamic> driveToRiderDestination(LatLng origin, LatLng destination) async{

    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': dotenv.get('API_KEY'),
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }

  Future<dynamic> updateRide(String accessToken,int requestID,String status) async{

    _dio.options.headers["Authorization"] = 'Bearer $accessToken';

    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/trip/update/$requestID' ,
          data: {
            'status': status,
          },
        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> cancelRide(String accessToken,String requestID,String reason) async{

    _dio.options.headers["Authorization"] = 'Bearer $accessToken';

    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/cancel' ,
        data: {
          'id': requestID,
          'cancel_reason': reason,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );
      print(response);

    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> rateRide(String accessToken, int requestID,int rating, String comment ) async{

    try {
      _dio.options.headers["Authorization"] = 'Bearer  $accessToken';
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/trip/$requestID/rate' ,
        data: {
          'rating': rating,
          'comment' : comment,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> upcomingTrips(String accessToken) async{

    try {
      _dio.options.headers["Authorization"] = 'Bearer  $accessToken';
      Response response = await _dio.get(
        dotenv.get('BASE_URL') + 'api/provider/requests/upcoming' ,

        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> historyTrips(String accessToken) async{
    try {
      _dio.options.headers["Authorization"] = 'Bearer  $accessToken';
      Response response = await _dio.get(
        dotenv.get('BASE_URL') + 'api/provider/requests/history' ,

        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> historyTripDetails(int requestID ,String accessToken) async{


    try {
      _dio.options.headers["Authorization"] = 'Bearer  $accessToken';
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/requests/history' ,
        data: {
          'request_id': requestID,
        },

        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future<dynamic> summary(String accessToken) async{

    try {
      _dio.options.headers["Authorization"] = 'Bearer $accessToken';
      Response response = await _dio.get(
        dotenv.get('BASE_URL') + 'api/provider/earnings' ,

        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      throw ErrorGettingEarnings;
    }
  }

  Future<void> callDriver(String accessToken,String userPhone,String driverPhone ) async{

    try {
      _dio.options.headers["Authorization"] = 'Bearer $accessToken';
      await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/call/user',
        data: {
          'phone_number': userPhone,
          'phone_number2': driverPhone,
        },

        options: Options(headers: {'Accept': 'application/json'}),
      );

    } on DioError catch (e) {
      throw ErrorCallingDriver;
    }
  }

  }




class RideRoute{
  final String bookingID;
  final String  paymentMethod;
  final String  serviceType;
  final String totalDistance;
  final int price;
  final String otp;
  final LatLng driverLocation;
  final LatLng riderLocation;
  final LatLng riderDestination;
  final String route;
  final dynamic user;


  const RideRoute({
    @required this.bookingID,
    @required this.paymentMethod,
    @required this.serviceType,
    @required this.totalDistance,
    @required this.price,
    @required this.otp,
    @required this.driverLocation,
    @required this.riderLocation,
    @required this.riderDestination,
    @required this.route,
    @required this.user,
  });




}

//Rider details

class RiderDetails{
  final String  fullName;
  final String  picture;
  final String  phone;
  final String  rating;
  final String price;
  final LatLng riderLocation;


  const RiderDetails({
       @required this.fullName,
       @required this.picture,
       @required this.phone,
       @required  this.rating,
      @required this.price,
      @required this.riderLocation,
        });
}

class RouteDriver{
  final LatLng markerSource;
  final LatLng markerDestination;
  final List<PointLatLng> polypoints;

  RouteDriver({@required this.markerSource, @required this.markerDestination, @required this.polypoints});


}

