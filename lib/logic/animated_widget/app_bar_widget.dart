import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  static const colorizeColors = [
    Color.fromARGB(255, 53, 39, 176),
    Color.fromARGB(255, 243, 33, 114),
    Colors.yellow,
    Color.fromARGB(255, 54, 244, 79),
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 22.0,
    fontFamily: 'Horizon',
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          ColorizeAnimatedText(
            'INFORMATION about LOCATION',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
      ),
    );
  }
}
