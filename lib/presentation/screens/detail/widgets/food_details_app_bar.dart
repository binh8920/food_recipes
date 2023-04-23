import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:homerecipes/providers/recipe_provider.dart';
import 'package:homerecipes/models/recipe_model.dart';
import 'package:homerecipes/presentation/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailsAppBar extends StatefulWidget {
  const FoodDetailsAppBar(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.yields,
      required this.steps,
      required this.nutrition,
      required this.cookTime})
      : super(key: key);
  final String name;
  final String imageUrl;
  final String yields;
  final List steps;
  final Map nutrition;
  final String cookTime;

  @override
  State<FoodDetailsAppBar> createState() => _FoodDetailsAppBarState();
}

class _FoodDetailsAppBarState extends State<FoodDetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      floating: true,
      foregroundColor: Color(0xFF222222),
      backgroundColor: Color(0xFFEEEEEE).withOpacity(0.1),
      titleSpacing: -10,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Provider.of<RecipeProvider>(
                context,
                listen: false,
              ).addRecipe(widget.name, widget.imageUrl, widget.yields,
                  widget.steps, widget.nutrition, widget.cookTime);
            },
            color: AppColors.primaryWidgetColor(),
          ),
        ),
        // Container(
        //   margin: EdgeInsets.only(right: 10),
        //   child: Icon(
        //     Icons.file_upload_outlined,
        //     color: Color(0xFF222222),
        //   ),
        // ),
      ],
    );
  }
}
