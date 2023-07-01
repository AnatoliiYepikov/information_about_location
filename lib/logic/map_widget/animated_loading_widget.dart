import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedLoadingWidget extends StatefulWidget {
  const AnimatedLoadingWidget({super.key});

  @override
  State<AnimatedLoadingWidget> createState() => _AnimatedLoadingWidgetState();
}

class _AnimatedLoadingWidgetState extends State<AnimatedLoadingWidget> {
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 40.0,
    fontFamily: 'Horizon',
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'MAP LOADING',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
      ),
    );
  }
}
