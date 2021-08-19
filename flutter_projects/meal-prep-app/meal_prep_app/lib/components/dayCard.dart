import 'package:flutter/material.dart';
import 'package:meal_prep_app/screens/dayView.dart/dayView.dart';
import 'package:meal_prep_app/screens/weekView/components/popupCard.dart';

class DayCard extends StatefulWidget {
  final String name;
  const DayCard({this.name});

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
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
                            if (widget.name == '+') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return PopupCard();
                                  });
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DayView(widget.name)));
                            }
                          },
                        )))
              ],
            ),
          ),
        ));
  }
}
