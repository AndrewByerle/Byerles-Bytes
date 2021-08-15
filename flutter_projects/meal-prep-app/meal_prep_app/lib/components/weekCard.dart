import 'package:flutter/material.dart';
import 'package:meal_prep_app/screens/planner/popupCard.dart';

class WeekCard extends StatefulWidget {
  final String name;
  WeekCard({this.name});

  @override
  _WeekCardState createState() => _WeekCardState();
}

class _WeekCardState extends State<WeekCard> {
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
                            child: Text(widget.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: widget.name == '+' ? (40) : (16),
                                    fontWeight: FontWeight.bold)))
                      ]),
                ),
                Positioned.fill(
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            widget.name == '+'
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return PopupCard();
                                    })
                                // ignore: unnecessary_statements
                                : ({});
                          },
                        )))
              ],
            ),
          ),
        ));
  }
}
