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

  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  String inputTime = "";
  String inputMeal = "";
  RecipeData data;

  Future<void> fetchData() async {
    RecipeData instance = new RecipeData(query: dayInfo[widget.name][1]);
    await instance.getData(0);

    setState(() {
      data = instance;
      DayCard.dayToImageMap[widget.name] = data.getUrl(0);
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
    children.add(MealCard(
        name: data.getLabel(1),
        image: data.getImage(1),
        url: data.getUrl(1),
        dayOfTheWeek: widget.name));
    children.add(MealCard(
        name: data.getLabel(2),
        image: data.getImage(2),
        url: data.getUrl(2),
        dayOfTheWeek: widget.name));
    children.add(MealCard(
        name: data.getLabel(1),
        image: data.getImage(3),
        url: data.getUrl(3),
        dayOfTheWeek: widget.name));
    return children;
  }

  Widget getInputDescriptions() {
    if (data != null) {
      return Container(
        child: Column(
          children: [
            Image(
                image: NetworkImage(data.getImage(0)),
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
                        _launchURL(data.getUrl(0));
                      },
                      child: Text(data.getLabel(0)),
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
                Text(data.getCalories(0),
                    style: TextStyle(color: Colors.black, fontSize: 24))
              ],
            ),
            ScrollNeighbors(children: generateMealCards()),
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
