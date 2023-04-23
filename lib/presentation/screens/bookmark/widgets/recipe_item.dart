import 'package:flutter/material.dart';
import 'package:homerecipes/presentation/screens/detail/recipe_detail_screen.dart';
import 'package:homerecipes/presentation/theme/color.dart';
import 'package:homerecipes/presentation/theme/styles.dart';

class RecipeItem extends StatelessWidget {
  String? thumbnailUrl;
  String? name;
  List? instruction;
  Map? nutrition;
  String? country;
  Map? userRatings;
  String? yields;
  String? cookTime;
  bool isFavorite;
  RecipeItem(
      {Key? key,
      this.thumbnailUrl,
      this.name,
      this.instruction,
      this.nutrition,
      this.country,
      this.userRatings,
      this.yields,
      this.cookTime,
      this.isFavorite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            thumbnailUrl!,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => FoodDetailsPage(
                        name: name!,
                        imageUrl: thumbnailUrl!,
                        yields: yields!,
                        steps: instruction!,
                        nutrition: nutrition!,
                        cookTime: cookTime!))));
          },
        ),
        footer: GridTileBar(
          title: Text(
            name!,
            textAlign: TextAlign.center,
            style: AppStyles.whiteColor11spw600Montserrat,
          ),
          backgroundColor: Colors.black54,
        ),
      ),
    );
  }
}
