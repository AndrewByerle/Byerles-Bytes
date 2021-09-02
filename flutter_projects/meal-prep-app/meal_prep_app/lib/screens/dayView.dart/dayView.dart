import 'package:flutter/material.dart';
import 'package:meal_prep_app/components/data/dayInfo.dart';
import 'package:meal_prep_app/components/dayCard.dart';
import 'package:meal_prep_app/components/loading.dart';
import 'package:meal_prep_app/models/recipeData.dart';
import 'package:meal_prep_app/screens/dayView.dart/components/mealCard.dart';
import 'package:url_launcher/url_launcher.dart';

class DayView extends StatefulWidget {
  final String name;
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
  RecipeData data2;
  RecipeData data3;
  RecipeData data4;

  Future<void> fetchData() async {
    RecipeData instance = new RecipeData(query: dayInfo[widget.name][1]);
    await instance.getData(0);

    RecipeData instance2 = new RecipeData(query: dayInfo[widget.name][1]);
    await instance2.getData(1);

    RecipeData instance3 = new RecipeData(query: dayInfo[widget.name][1]);
    await instance3.getData(2);

    RecipeData instance4 = new RecipeData(query: dayInfo[widget.name][1]);
    await instance4.getData(3);

    setState(() {
      data = instance;
      print('setdata');
      data2 = instance2;
      print('setdata2');
      data3 = instance3;
      data4 = instance4;

      DayCard.dayToImageMap[widget.name] = data.url;
      // print(DayCard.dayToImageMap[widget.name]);
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

  List<Widget> generateMealCards() {
    List<Widget> children = [];
    print(data2.name);
    children.add(
        MealCard(name: data2.label, data: data2, dayOfTheWeek: widget.name));
    children.add(
        MealCard(name: data3.label, data: data3, dayOfTheWeek: widget.name));
    children.add(
        MealCard(name: data4.label, data: data4, dayOfTheWeek: widget.name));
    return children;
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: ClipRRect(
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
                              Colors.lightGreen,
                              Colors.green,
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
                        _launchURL(data.url);
                      },
                      child: Text('${data.label}'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
              child: Row(
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
            ScrollNeighbors(children: generateMealCards()),
            // MealCard(name: data2.label, data: data2)
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

class ScrollNeighbors extends StatelessWidget {
  const ScrollNeighbors({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: Row(children: children));
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch ${url}';
  }
}
