import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
          Colors.pinkAccent,
          Colors.blue[900],
          // Colors.green[800],
          // Colors.lightGreen,
          // Colors.green[800],
          Colors.blue
        ])));
  }
}
