import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:information_about_location/data/geolocator/geolocator_model.dart';
import 'package:information_about_location/data/geolocator/geolocator_service.dart';
import 'package:information_about_location/data/solar_day/solar_day_model.dart';

Future<SolarDayModel> fetchSolarDayModel() async {
  CoordinatesModel coordinates = await determinePosition();
  final response = await http.get(Uri.parse(
      'https://api.sunrise-sunset.org/json?lat=${coordinates.latitude.toString()}&lng=${coordinates.longitude.toString()}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SolarDayModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load SolarDayModel');
  }
}
