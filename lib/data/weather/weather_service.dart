import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:information_about_location/data/weather/weather_model.dart';
//import 'package:information_about_location/data/coordinates/coordinates_model.dart';
//import 'package:information_about_location/data/coordinates/coordinates_service.dart';
import 'package:information_about_location/presentation/home.dart';

Future<WeatherModel> fetchWeatherModel() async {
  //CoordinatesModel coordinates = await determinePosition();
  final response = await http.get(Uri.parse(
      'http://api.openweathermap.org/data/2.5/weather?lat=${coordinates.latitude.toString()}&lon=${coordinates.longitude.toString()}&APPID=71ecff3581eaee9a512f2979e487432b'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return WeatherModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load WeatherModel');
  }
}
