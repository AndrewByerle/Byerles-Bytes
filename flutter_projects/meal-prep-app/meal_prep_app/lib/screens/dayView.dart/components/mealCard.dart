import 'package:flutter/material.dart';
import 'package:meal_prep_app/models/recipeData.dart';
import 'package:url_launcher/url_launcher.dart';

class MealCard extends StatelessWidget {
  final String name;
  final RecipeData data;
  final String dayOfTheWeek;

  MealCard({this.name, this.data, this.dayOfTheWeek});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 140,
            width: 160,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Image(
                          image: NetworkImage(data.image),
                          fit: BoxFit.fill,
                          height: 85,
                          width: 160),
                      Container(
                          width: 140,
                          child: Text(name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
                Positioned.fill(
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            _launchURL(data.url);
                          },
                        )))
              ],
            ),
          ),
        ));
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch ${url}';
  }
}
