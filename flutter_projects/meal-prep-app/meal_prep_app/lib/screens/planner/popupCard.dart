import 'package:flutter/material.dart';
import 'package:meal_prep_app/screens/planner/dropDown.dart';

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
      scrollable: true,
      title: Text('Plan Meal'),
      content: Column(
        children: [
          DropDown('Day: ', days, 'Pick a Day'),
          DropDown('Time: ', times, 'Pick a Time'),
          DropDown('Meal: ', times, 'Pick a Time'),
        ],
      ),
      actions: [ElevatedButton(child: Text("Submit"), onPressed: () {})],
    );
  }
}

// Not used currently
class PopupCardBody extends StatelessWidget {
  const PopupCardBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Day (ex. Monday)',
              icon: Icon(Icons.account_box),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              icon: Icon(Icons.email),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Message',
              icon: Icon(Icons.message),
            ),
          ),
        ],
      ),
    );
  }
}
