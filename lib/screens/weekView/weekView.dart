import 'package:flutter/material.dart';
import 'package:meal_prep_app/components/background.dart';
import 'package:meal_prep_app/components/dayCard.dart';
import 'package:meal_prep_app/components/data/days.dart';

class WeekView extends StatefulWidget {
  WeekView({Key key}) : super(key: key);

  @override
  _WeekViewState createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  List<Widget> children;

  @override
  void initState() {
    super.initState();
    getWeekList();
  }

  void getWeekList() {
    List<Widget> newChildren = [];
    // days list in components
    for (String day in days) {
      newChildren.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: DayCard(name: day),
      ));
    }
    children = newChildren;
    children.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: DayCard(name: '+'),
    ));

    setState(() {
      children = newChildren;
    });
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
