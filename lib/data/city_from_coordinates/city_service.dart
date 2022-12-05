import 'package:information_about_location/data/city_from_coordinates/city_model.dart';
import 'package:information_about_location/data/geolocator/geolocator_model.dart';
import 'package:information_about_location/data/geolocator/geolocator_service.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<CityModel> fetchCityModel() async {
  CoordinatesModel coordinates = await determinePosition();
  final response = await http.get(Uri.parse(
      'http://api.openweathermap.org/geo/1.0/reverse?lat=${coordinates.latitude.toString()}&lon=${coordinates.longitude.toString()}&limit=5&appid=71ecff3581eaee9a512f2979e487432b'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CityModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load CityModel');
  }
}
