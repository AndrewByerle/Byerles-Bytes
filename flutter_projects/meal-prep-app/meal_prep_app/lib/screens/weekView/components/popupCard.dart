import 'package:flutter/material.dart';
import 'package:meal_prep_app/screens/weekView/components/dropDown.dart';

class PopupCard extends StatelessWidget {
  // const
  PopupCard({
    Key key,
  }) : super(key: key);

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final List<String> times = ['Breakfast', 'Lunch', 'Dinner', 'Snack'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      scrollable: true,
      title: Container(
        alignment: Alignment.center,
        child: Text(
          'Plan Meal',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        color: Colors.purple[700],
        height: 70,
      ),
      content: Column(
        children: [
          Row(
            children: [
              Icon(Icons.assignment_rounded),
              DropDown('Day: ', days, 'Pick a Day'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.alarm),
              DropDown('Time: ', times, 'Pick a Time'),
            ],
          ),
          // DropDown('Meal: ', times, 'Pick a Time'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Search for Meal',
              icon: Icon(Icons.add_box_sharp),
            ),
          )
        ],
      ),
      actions: [ElevatedButton(child: Text("Submit"), onPressed: () {})],
    );
  }
}
