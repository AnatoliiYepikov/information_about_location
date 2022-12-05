import 'package:flutter/material.dart';
import 'package:information_about_location/logic/city_widget/city_widget.dart';
import 'package:information_about_location/logic/solar_day_widget/solar_day_widget.dart';
import 'package:information_about_location/logic/weather_widget/weather_widget.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INFORMATION about LOCATION',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('INFORMATION about LOCATION'),
        ),
        body: Center(
          child: Column(
            children: const [
              Expanded(
                child: CityWidget(),
              ),
              Expanded(
                child: WeatherWidget(),
              ),
              Expanded(
                child: SolarDayWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
