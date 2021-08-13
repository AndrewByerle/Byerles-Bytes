import 'package:flutter/material.dart';
import 'package:meal_prep_app/components/weekCard.dart';
import 'package:meal_prep_app/screens/home/components/background.dart';

class WeekView extends StatefulWidget {
  WeekView({Key key}) : super(key: key);

  @override
  _WeekViewState createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  List<Widget> children;
  List<String> weeks = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void initState() {
    super.initState();
    getWeekList();
  }

  void getWeekList() {
    List<Widget> newChildren = [];
    for (String day in weeks) {
      newChildren.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: WeekCard(name: day),
      ));
    }
    children = newChildren;
    children.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: WeekCard(name: '+'),
    ));

    // setState(() {
    //   children = newChildren;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Week')),
        body: Stack(children: [
          Center(child: GradientBackground()),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.25,
            children: children,
          )
        ]));
  }
}
