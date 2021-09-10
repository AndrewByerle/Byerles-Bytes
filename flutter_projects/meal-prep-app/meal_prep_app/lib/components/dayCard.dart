import 'package:flutter/material.dart';
import 'package:meal_prep_app/screens/dayView.dart/dayView.dart';
import 'package:meal_prep_app/screens/weekView/components/popupCard.dart';

class DayCard extends StatefulWidget {
  final String name;
  const DayCard({this.name});
  // static so imgUrl can be accessed from other class

  // Maps Day of week to an imageUrl
  static Map dayToImageMap = {};

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  Widget dayOfWeekCardBody() {
    // if (DayCard.dayToImageMap != null &&
    //     DayCard.dayToImageMap[widget.name] != null) {
    //   return Image(
    //       image: NetworkImage(DayCard.dayToImageMap[widget.name]),
    //       fit: BoxFit.fill,
    //       height: 85,
    //       width: 160);
    // }
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 140,
          child: Text(widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: widget.name == '+' ? (40) : (16),
                  fontWeight: FontWeight.bold)))
    ]);
  }

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
                Positioned.fill(child: dayOfWeekCardBody()),
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
