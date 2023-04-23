import 'dart:convert';

import 'package:homerecipes/models/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteData {
  List<String>? list = [];
  List<Recipe>? recipeList = [];
  static SharedPreferences? prefs;
  static Future init() async => prefs = await SharedPreferences.getInstance();
  read(String key) {
    try {
      recipeList!.clear();
      list!.clear();
      list!.addAll(prefs!.getStringList(key)!);
      for (var item in list!) {
        recipeList!.add(Recipe.fromJson(json.decode(item)));
      }
    } catch (_) {
      // print(e);
    }

    return recipeList;
  }

  save(String key, List<Recipe> recipeList) async {
    list!.clear();
    for (var item in recipeList) {
      list!.add(json.encode(item.toJson()));
    }
    prefs!.setStringList(key, list!);
  }
}
