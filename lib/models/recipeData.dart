import 'dart:convert';

import 'package:http/http.dart';

class RecipeData {
  String name;
  String query;
  String image;
  String calories;
  String label;
  String url;
  int page;
  Map mapData;

  RecipeData({this.query, this.page});

  //async used for data from API

  Future<void> getData(page) async {
    try {
      //Get Data
      const APP_ID = '5444c14e';
      const APP_KEY = '0ca199f8ba15ae0ac6557db651d11f39';

      Response response = await get(Uri.parse(
          'https://api.edamam.com/search?q=${query}&app_id=${APP_ID}&app_key=${APP_KEY}'));

      Map data = jsonDecode(response.body);
      mapData = data;
    } catch (e) {
      print(e);
    }
  }

  String getImage(int page) {
    return mapData["hits"][page]["recipe"]["image"];
  }

  String getLabel(int page) {
    if (mapData["hits"][page]["recipe"]["label"] != null) {
      return mapData["hits"][page]["recipe"]["label"];
    }
    print("label not printed");
    return "";
  }

  String getUrl(int page) {
    if (mapData["hits"][page]["recipe"]["url"] != null) {
      return mapData["hits"][page]["recipe"]["url"];
    }
    print("Url not printed");
    return "";
  }

  String getCalories(int page) {
    String longDecimalCalories = mapData["hits"][page]["recipe"]
            ["totalNutrients"]["ENERC_KCAL"]["quantity"]
        .toString();
    calories = longDecimalCalories.split(".")[0];
    return calories;
  }
}
