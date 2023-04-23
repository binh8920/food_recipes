import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:homerecipes/presentation/screens/detail/widgets/recipes/my_recipe.dart';
import 'package:homerecipes/presentation/screens/start/widgets/bottom_container.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  var _isInit = true;
  var _isLoading = false;
  bool showRcp = false;
  var recipes;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FloatingActionButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        final url = Uri.parse(
            '${dotenv.get('API_URL', fallback: '')}api/recipeList/views');
        http.get(url).then((value) {
          final extractedData =
              json.decode(value.body) as Map<dynamic, dynamic>;
          if (extractedData['recipes'] == null) {
            showRcp = true;
          } else {
            showRcp = false;
          }
          recipes = extractedData['recipes'].toString();
          setState(() {
            _isLoading = false;
          });
        });
      } catch (error) {
        const errorMessage = 'Something went wrong. Please try again later.';
        _showErrorDialog(errorMessage);
      }
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: SizedBox(),
          )
        : (showRcp
            ? (Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.network(
                          'https://i.pinimg.com/564x/cc/a5/e6/cca5e6645d0890b15e4fcdb44223f129.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: BottomContainer(),
                      ),
                    ],
                  ),
                ),
              ))
            : MyRecipes(
                comments: recipes,
              ));
  }
}
