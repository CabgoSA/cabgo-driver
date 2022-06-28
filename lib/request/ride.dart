import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'directions_model.dart';




class Ride {
  final Dio _dio = Dio();
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';


  Future<dynamic> acceptRide(int requestID) async {
    String accessToken = 'Bearer  eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI0OCwiaXNzIjoiaHR0cHM6Ly9jYWJnby5jby56YS9hcGkvcHJvdmlkZXIvb2F1dGgvdG9rZW4iLCJpYXQiOjE2NTYzMjAwODEsImV4cCI6MTY1NjY4MDA4MSwibmJmIjoxNjU2MzIwMDgxLCJqdGkiOiJ3MWFUMTdHd2VtS1lwWXZnIn0.ciU2BofTYr01cR3MBVaaFEpWu9q71dUwwx1zQsUEvUc';
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
  });




}
