import 'package:flutter/material.dart';
import 'package:meal_prep_app/components/data/dayInfo.dart';
import 'package:meal_prep_app/components/loading.dart';
import 'package:meal_prep_app/models/recipeData.dart';

class DayView extends StatefulWidget {
  final String name;
  // DayView(this.name, this.inputDay, this.inputTime, this.inputMeal);
  DayView(this.name);
  // Second Constructor
  // DayView.input(this.name, this.inputDay, this.inputTime, this.inputMeal);

  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  String inputDay = "";
  String inputTime = "";
  String inputMeal = "";
  RecipeData data;

  Future<void> fetchData() async {
    RecipeData instance = new RecipeData(query: dayInfo[widget.name][1]);
    await instance.getData();

    setState(() {
      data = instance;
    });
  }

  @override
  void initState() {
    super.initState();
    if (dayInfo[widget.name] != null) {
      fetchData();
      print('fetched data');
    }
    getDayViewInput();
  }

  void getDayViewInput() {
    dayInfo.forEach((key, value) {
      if (key == widget.name) {
        // Had setState in here previously
        inputTime = value[0];
        inputMeal = value[1];
      }
    });
  }

  Widget getInputDescriptions() {
    if (data != null) {
      return Container(
        child: Column(
          children: [
            Image(image: NetworkImage(data.image)),
            Text('${data.url}', style: TextStyle(color: Colors.pink)),
            Text('${data.label}', style: TextStyle(color: Colors.pink)),
            Text('${data.calories}', style: TextStyle(color: Colors.pink))
          ],
        ),
      );
    }
    return Text('Browse for a meal');
  }

  @override
  Widget build(BuildContext context) {
    return (data == null && dayInfo[widget.name] != null)
        ? Loading()
        : Scaffold(
            appBar: AppBar(title: Text(widget.name)),
            body: Container(
              child: Column(
                children: [
                  Text(
                    inputDay,
                    style: TextStyle(color: Colors.pink),
                  ),
                  Text(inputTime, style: TextStyle(color: Colors.pink)),
                  Text(inputMeal, style: TextStyle(color: Colors.pink)),
                  getInputDescriptions(),
                ],
              ),
            ));
  }
}
