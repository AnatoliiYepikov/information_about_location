import 'package:flutter/material.dart';
import 'package:information_about_location/logic/animated_widget/app_bar_widget.dart';

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
