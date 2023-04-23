import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homerecipes/presentation/common/list_recipe.dart';
import 'package:homerecipes/providers/recipe_provider.dart';
import 'package:provider/provider.dart';
import 'package:homerecipes/data/favorite_data.dart';
import 'package:homerecipes/models/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import './recipe_item.dart';

class RecipeGrid extends StatefulWidget {
  const RecipeGrid({Key? key}) : super(key: key);

  @override
  State<RecipeGrid> createState() => _RecipeGridState();
}

class _RecipeGridState extends State<RecipeGrid> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<RecipeProvider>(context).fetchUserRecipe().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final listRecipe = Provider.of<RecipeProvider>(context).items;
    var isEmpty = listRecipe.isEmpty;
    print(listRecipe);
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : (isEmpty
            ? Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Center(
                  child: Image.asset(
                    'assets/images/nr-logo.png',
                    height: 20.h,
                    //width: 8.w,
                  ),
                ),
              )
            : GridView.builder(
                padding: EdgeInsets.all(2.sp),
                itemCount: listRecipe.length,
                itemBuilder: (context, index) => RecipeItem(
                  thumbnailUrl: listRecipe[index].thumbnailUrl,
                  name: listRecipe[index].name,
                  instruction: listRecipe[index].instruction,
                  nutrition: listRecipe[index].nutrition,
                  country: listRecipe[index].country,
                  userRatings: listRecipe[index].userRatings,
                  yields: listRecipe[index].yields,
                  cookTime: listRecipe[index].cookTime,
                  isFavorite: listRecipe[index].isFavorite,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
              ));
  }
}
