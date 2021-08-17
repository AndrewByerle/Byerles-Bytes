import 'package:flutter/material.dart';
import 'package:meal_prep_app/components/data/dayInfo.dart';
import 'package:meal_prep_app/components/data/days.dart';
import 'package:meal_prep_app/screens/weekView/components/dropDown.dart';

class PopupCard extends StatefulWidget {
  // const
  PopupCard({
    Key key,
  }) : super(key: key);

  @override
  _PopupCardState createState() => _PopupCardState();
}

class _PopupCardState extends State<PopupCard> {
  final List<String> times = ['Breakfast', 'Lunch', 'Dinner', 'Snack'];

  TextEditingController textFieldController = TextEditingController();

  void _sendDataToDayViewScreen(context) {
    String inputMeal = textFieldController.text;
    tempInfo['meal'] = inputMeal;
    print(tempInfo['meal']);
    dayInfo[tempInfo['day']] = [tempInfo['time'], tempInfo['meal']];
    // dayInfo.forEach((key, value) {
    //   for (String val in value) {
    //     print(val);
    //   }
    // });

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => SecondScreen(text: textToSend,),
    //     ));
  }

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
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Search for Meal',
              icon: Icon(Icons.add_box_sharp),
            ),
            controller: textFieldController,
          )
        ],
      ),
      actions: [
        ElevatedButton(
            child: Text("Submit"),
            onPressed: () {
              _sendDataToDayViewScreen(context);
            })
      ],
    );
  }
}
