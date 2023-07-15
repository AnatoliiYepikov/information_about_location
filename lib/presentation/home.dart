import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:information_about_location/data/map/map_service.dart';
import 'package:information_about_location/logic/animated_widget/app_bar_widget.dart';

import 'package:information_about_location/logic/map_widget/map_widget.dart';
import 'package:latlong2/latlong.dart';

late final MapController mapController;
LatLng coordinates = LatLng(42.7629600, 11.1094100);
Future<LatLng> coordinates1 = fetchMapCoordinates();

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
        body: const SafeArea(
          child: Column(
            children: [
              Expanded(
                child: MapWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
