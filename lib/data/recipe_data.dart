import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../models/recipe_model.dart';

class ApiServices {
  final String baseUrl = 'https://tasty.p.rapidapi.com/recipes/list';

  Future<List<Recipe>> getRecipes(String type) async {
    var queryParameters = {
      'from': '0',
      'size': '30',
      'tags': type,
    };

    var headers = {
      'X-RapidAPI-Key': '2c7bd72035msh97f3da9a2a28c80p1c9ef6jsn51946531361f',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
    };
    try {
      final url =
          Uri.https('tasty.p.rapidapi.com', '/recipes/list', queryParameters);
      final response = await http.get(url, headers: headers);
      final recipes = convert.jsonDecode(response.body)['results'] as List;
      List<Recipe> recipeList =
          recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
      print(recipeList);
      return recipeList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
