import 'package:flutter/material.dart';
import 'package:meal_prep_app/components/data/dayInfo.dart';
import 'package:meal_prep_app/models/recipeData.dart';

class DayView extends StatefulWidget {
  final String name;
  // String inputDay = "";
  // String inputTime = "";
  // String inputMeal = "";
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
  String inputMeal = "Text";

  RecipeData data;

  Future<void> fetchData() async {
    RecipeData instance = new RecipeData(query: 'pasta and red sauce');
    await instance.getData();

    setState(() {
      data = instance;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
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
              ),
              Text(
                inputDay,
                style: TextStyle(color: Colors.pink),
              ),
              Text(inputTime, style: TextStyle(color: Colors.pink)),
              Text(inputMeal, style: TextStyle(color: Colors.pink)),
              Image(image: NetworkImage(data.image)),
              Text('${data.url}', style: TextStyle(color: Colors.pink)),
            ],
          ),
        ));
  }
}
