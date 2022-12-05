import 'package:flutter/material.dart';
import 'package:information_about_location/data/weather/weather_model.dart';
import 'package:information_about_location/data/weather/weather_service.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late Future<WeatherModel> futureWeatherModel;

  @override
  void initState() {
    futureWeatherModel = fetchWeatherModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModel>(
      future: futureWeatherModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text('Temp: ${snapshot.data!.temp}'),
              Text('Description: ${snapshot.data!.description}'),
              Text('Currently: ${snapshot.data!.currently}'),
              Text('Humidity: ${snapshot.data!.humidity}'),
              Text('WindSpeed: ${snapshot.data!.windSpeed}'),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
