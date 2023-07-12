import 'package:flutter/material.dart';
import 'package:information_about_location/logic/animated_widget/app_bar_widget.dart';
import 'package:information_about_location/logic/city_widget/city_widget.dart';
import 'package:information_about_location/logic/solar_day_widget/solar_day_widget.dart';
import 'package:information_about_location/logic/weather_widget/weather_widget.dart';

import 'package:information_about_location/logic/map_widget/map_widget.dart';

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
          appBarTheme: const AppBarTheme(
        color: Colors.amber,
      )),
      home: Scaffold(
        appBar: AppBar(
          title: const AppBarWidget(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const CityWidget(),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(child: WeatherWidget()),
                          Expanded(child: SolarDayWidget()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 5,
                child: MapWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
