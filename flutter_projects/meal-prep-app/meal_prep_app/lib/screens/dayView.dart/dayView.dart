import 'package:flutter/material.dart';
import 'package:meal_prep_app/components/data/dayInfo.dart';
import 'package:meal_prep_app/components/loading.dart';
import 'package:meal_prep_app/models/recipeData.dart';
import 'package:url_launcher/url_launcher.dart';

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
  // String inputDay = "";
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

  _launchURL() async {
    // if (await canLaunch(data.url)) {
    //   await launch(data.url);
    // } else {
    //   throw 'Could not launch ${data.url}';
    // }
    await launch(data.url);
  }

  Widget getInputDescriptions() {
    if (data != null) {
      return Container(
        child: Column(
          children: [
            Image(
                image: NetworkImage(data.image),
                fit: BoxFit.fill,
                width: double.maxFinite,
                // scale img height
                height: MediaQuery.of(context).size.height / 2.5),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 50),
                    Text(inputTime + ":",
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                    SizedBox(
                      width: 50,
                    ),
                    Text(inputMeal,
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text("Calories:", style: TextStyle(fontSize: 24)),
                    SizedBox(width: 28),
                    Text('${data.calories}',
                        style: TextStyle(color: Colors.black, fontSize: 24))
                  ],
                ),
                // Text('${data.url}', style: TextStyle(color: Colors.black)),
                // Text('${data.label}', style: TextStyle(color: Colors.black)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                // Color(0xFF0D47A1),
                                // Color(0xFF1976D2),
                                // Color(0xFF42A5F5),
                                Colors.green,
                                Colors.green,
                                Colors.lightGreen
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          _launchURL();
                        },
                        child: Text('${data.label}'),
                      ),
                    ],
                  ),
                ),
              ],
            )
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
                  getInputDescriptions(),
                ],
              ),
            ));
  }
}
