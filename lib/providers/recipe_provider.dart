import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:homerecipes/data/recipe_data.dart';
import 'package:homerecipes/models/recipe_model.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _items = [];

  List<Recipe> get items {
    return [..._items];
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  Future<void> fetchUserRecipe() async {
    String? deviceId = await _getId();
    final url = Uri.parse('${dotenv.get('URL', fallback: '')}recipes.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<dynamic, dynamic>;
      print(extractedData);
      final List<Recipe> loadedRecipe = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((valueId, valueData) {
        if (valueData['deviceId'] == deviceId) {
          loadedRecipe.add(
            Recipe(
              //id: valueId,
              deviceId: valueData['deviceId'],
              name: valueData['name'],
              thumbnailUrl: valueData['imageUrl'],
              yields: valueData['yields'],
              instruction: valueData['steps'],
              nutrition: valueData['nutrition'],
              cookTime: valueData['cookTime'],
            ),
          );
        }
      });

      _items = loadedRecipe;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addRecipe(
    String name,
    String imageUrl,
    String yields,
    List steps,
    Map nutrition,
    String cookTime,
  ) async {
    String? deviceId = await _getId();

    final url = Uri.parse('${dotenv.get('URL', fallback: '')}recipes.json');

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'deviceId': deviceId,
          'name': name,
          'imageUrl': imageUrl,
          'yields': yields,
          'steps': steps,
          'nutrition': nutrition,
          'cookTime': cookTime,
        }),
      );
      final newProduct = Recipe(
        deviceId: deviceId,
        name: name,
        thumbnailUrl: imageUrl,
        yields: yields,
        instruction: steps,
        nutrition: nutrition,
        cookTime: cookTime,
      );
      print(json.decode(response.body)['name']);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
