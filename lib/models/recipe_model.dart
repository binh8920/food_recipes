import 'dart:core';

import 'package:flutter/material.dart';

class Recipe with ChangeNotifier {
  int? id;
  String? deviceId;
  String? thumbnailUrl;
  String? name;
  List? instruction;
  Map? nutrition;
  String? country;
  Map? userRatings;
  String? yields;
  String? cookTime;
  bool isFavorite = false;

  Recipe(
      {this.id,
      this.deviceId,
      this.thumbnailUrl,
      this.name,
      this.instruction,
      this.nutrition,
      this.country,
      this.userRatings,
      this.yields,
      this.cookTime,
      this.isFavorite = false});

  Map<String, dynamic> toJson() => {
        "thumbnailUrl": thumbnailUrl,
        "name": name,
        "instruction": instruction,
        "nutrition": nutrition,
        "yields": yields,
        "cookTime": cookTime,
      };

  Recipe.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('recipes')) {
      id = json['id'];
      thumbnailUrl = json['thumbnail_url'];
      name = json['name'];
      instruction = json['instructions'];
      if (json['nutrition']?.isEmpty ?? true) {
        nutrition = {'calories': 'N/A', 'nutrition': 'N/A'};
      } else {
        nutrition = json['nutrition'] as Map<String, dynamic>;
        nutrition?.remove('updated_at');
      }
      country = json['country'];
      if ((json['user_ratings'] as Map)['score'] == null) {
        userRatings = {'score': 'N/A'};
      } else {
        userRatings = json['user_ratings'];
      }
      yields = json['yields'];
      if (json['cook_time_minutes'] == null) {
        cookTime = 'N/A';
      } else {
        cookTime = json['cook_time_minutes'].toString();
      }
    } else {
      id = json['id'];
      thumbnailUrl = json['thumbnail_url'];
      name = json['name'];
      instruction = (json['recipes'] as List)[0]['instructions'];
      if ((json['recipes'] as List)[0]['nutrition']?.isEmpty ?? true) {
        nutrition = {'calories': 'N/A', 'nutrition': 'N/A'};
      } else {
        nutrition =
            (json['recipes'] as List)[0]['nutrition'] as Map<String, dynamic>;
        nutrition?.remove('updated_at');
      }
      country = json['country'];
      if (((json['recipes'] as List)[0]['user_ratings'] as Map)['score'] ==
          null) {
        userRatings = {'score': 'N/A'};
      } else {
        userRatings = (json['recipes'] as List)[0]['user_ratings'];
      }
      yields = (json['recipes'] as List)[0]['yields'];
      if ((json['recipes'] as List)[0]['cook_time_minutes'] == null) {
        cookTime = 'N/A';
      } else {
        cookTime = (json['recipes'] as List)[0]['cook_time_minutes'].toString();
      }
    }
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
