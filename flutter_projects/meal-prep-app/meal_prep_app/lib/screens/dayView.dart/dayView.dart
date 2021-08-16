import 'package:flutter/material.dart';

class DayView extends StatefulWidget {
  final String name;
  String inputDay;
  String inputTime;
  String inputMeal;
  DayView(this.name);
  // Second Constructor
  DayView.input(this.name, this.inputDay, this.inputTime, this.inputMeal);

  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  @override
  void initState() {
    super.initState();
    // getCountryList("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.name)),
        body: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Plan a meal...",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                    border: InputBorder.none),
                style: TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ));
  }
}
