import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import './widgets/fav_recipe.dart';

class MyRecipes extends StatefulWidget {
  const MyRecipes({Key? key, this.comments}) : super(key: key);
  final comments;

  @override
  State<MyRecipes> createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> {
  final controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipesScreen(
        controller: controller,
        comments: widget.comments,
      ),
    );
  }
}
