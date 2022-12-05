import 'package:flutter/material.dart';
import 'package:information_about_location/data/solar_day/solar_day_model.dart';
import 'package:information_about_location/data/solar_day/solar_day_service.dart';

class SolarDayWidget extends StatefulWidget {
  const SolarDayWidget({super.key});

  @override
  State<SolarDayWidget> createState() => _SolarDayWidgetState();
}

class _SolarDayWidgetState extends State<SolarDayWidget> {
  late Future<SolarDayModel> futureSolarDayModel;

  @override
  void initState() {
    futureSolarDayModel = fetchSolarDayModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SolarDayModel>(
      future: futureSolarDayModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text('Sunrise: ${snapshot.data!.sunrise}'),
              Text('Sunset: ${snapshot.data!.sunset}'),
              Text('SolarNoon: ${snapshot.data!.solarNoon}'),
              Text('DayLength: ${snapshot.data!.dayLength}'),
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
