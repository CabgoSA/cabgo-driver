import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'directions_model.dart';




class Ride {
  final Dio _dio = Dio();
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  String accessToken = 'Bearer  eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI0OCwiaXNzIjoiaHR0cHM6Ly9jYWJnby5jby56YS9hcGkvcHJvdmlkZXIvb2F1dGgvdG9rZW4iLCJpYXQiOjE2NTY3NjMxMTYsImV4cCI6MTY1NzEyMzExNiwibmJmIjoxNjU2NzYzMTE2LCJqdGkiOiI5Mm9jZFpkRUExdFl6NzNXIn0.cJTl1DZzS20vom7JRK1qyYs6F00kpj6_bG60mt6cFVU';


  Future<dynamic> acceptRide(int requestID) async {
    _dio.options.headers["Authorization"] = accessToken;
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/trip/update/$requestID' ,

        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
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

  Future<dynamic> updateRide(int requestID) async{
    _dio.options.headers["Authorization"] = accessToken;
    try {
      Response response = await _dio.put(
        dotenv.get('BASE_URL') + 'api/provider/trip/$requestID' ,

        options: Options(headers: {'Accept': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
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
  final String  rating;
  final String price;
  final LatLng riderLocation;


  const RiderDetails({
       @required this.fullName,
       @required this.picture,
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