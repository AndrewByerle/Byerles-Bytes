import 'package:flutter/material.dart';

class WeekCard extends StatelessWidget {
  final String name;

  WeekCard({this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 140,
            width: 160,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 140,
                            child: Text(name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)))
                      ]),
                ),
                Positioned.fill(
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                        )))
              ],
            ),
          ),
        ));
  }
}
