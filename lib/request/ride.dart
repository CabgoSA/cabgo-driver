import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'directions_model.dart';




class Ride {
  final Dio _dio = Dio();
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  String accessToken = 'Bearer  eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI0OCwiaXNzIjoiaHR0cHM6Ly9jYWJnby5jby56YS9hcGkvcHJvdmlkZXIvb2F1dGgvdG9rZW4iLCJpYXQiOjE2NTY2ODA5ODksImV4cCI6MTY1NzA0MDk4OSwibmJmIjoxNjU2NjgwOTg5LCJqdGkiOiJVallRVXQ4WHBoRWdMS3o4In0.1hS_WjRP2OipmrrQb8n6Y0yenHEz3pdBYmyBI8NwVy4';


  Future<dynamic> acceptRide(int requestID) async {
    _dio.options.headers["Authorization"] = accessToken;
    try {
      Response response = await _dio.post(
        dotenv.get('BASE_URL') + 'api/provider/trip/$requestID' ,

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