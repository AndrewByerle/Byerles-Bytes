import 'dart:convert';

import 'package:http/http.dart';

class RecipeData {
  String name;
  String query;
  String image;
  String calories;
  String label;
  String url;

  RecipeData({this.query});

  //async used for data from API

  Future<void> getData() async {
    try {
      //Get Data
      const APP_ID = '5444c14e';
      const APP_KEY = '0ca199f8ba15ae0ac6557db651d11f39';

      Response response = await get(Uri.parse(
          'https://api.edamam.com/search?q=${query}&app_id=${APP_ID}&app_key=${APP_KEY}'));

      Map data = jsonDecode(response.body);

      //Set Fields
      image = data["hits"][0]["recipe"]["image"];
      label = data["hits"][0]["recipe"]["label"];

      url = data["hits"][0]["recipe"]["url"];
      String longDecimalCalories = data["hits"][0]["recipe"]["totalNutrients"]
              ["ENERC_KCAL"]["quantity"]
          .toString();
      calories = longDecimalCalories.split(".")[0];
      print(calories);
    } catch (e) {
      print(e);
    }
  }
}
