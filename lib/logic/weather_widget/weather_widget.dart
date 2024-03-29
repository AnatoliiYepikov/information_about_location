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
    //futureWeatherModel = fetchWeatherModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModel>(
      future: fetchWeatherModel(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              const Text(
                'TEMP:',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Text(
                'Description: ${snapshot.data!.description}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                'Currently: ${snapshot.data!.currently}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                'Humidity: ${snapshot.data!.humidity}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                'WindSpeed: ${snapshot.data!.windSpeed}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
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
