import 'package:flutter/material.dart';
import 'package:homerecipes/presentation/common/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import './widgets/food_details_app_bar.dart';
import './widgets/food_infos.dart';
import './widgets/ingredient.dart';
import './widgets/ingredient_list.dart';
import './widgets/ingredients_heading.dart';
import './widgets/prepare_step.dart';
import './widgets/prepare_step_heading.dart';
import './widgets/prepare_step_list.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import 'package:homerecipes/presentation/theme/palette.dart';
import 'package:homerecipes/presentation/common/custom_divider.dart';
import 'package:homerecipes/presentation/common/line.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homerecipes/models/nutrition_model.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage(
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
  Widget build(BuildContext context) {
    List<Nutrition> nutritionList = nutrition.entries
        .map<Nutrition>((entry) => Nutrition(entry.key, entry.value.toString()))
        .toList();

    bool isTablet;
    double ratio =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;
    if ((ratio >= 0.74) && (ratio < 1.5)) {
      isTablet = true;
    } else {
      isTablet = false;
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          FoodDetailsAppBar(
              name: name,
              imageUrl: imageUrl,
              yields: yields,
              steps: steps,
              nutrition: nutrition,
              cookTime: cookTime),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: isTablet ? 40.h : 27.h,
                  width: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h, right: 3.w, left: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FoodInfos(
                          calories: nutrition['calories'].toString(),
                          cookTime: cookTime,
                          yields: yields,
                          name: name),
                      const CustomDivider(),
                      const IngredientsHeading(),
                    ],
                  ),
                )
              ],
            ),
          ),
          IngredientList(
            nutrition: nutritionList,
          ),
          PrepareStepHeading(),
          PrepareStepList(content: steps)
        ],
      ),
    );
  }
}
