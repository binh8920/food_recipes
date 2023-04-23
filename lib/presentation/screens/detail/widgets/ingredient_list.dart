import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import './ingredient.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({Key? key, required this.nutrition}) : super(key: key);

  final List nutrition;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 2.h, right: 3.w, left: 3.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 1,
          crossAxisCount: 2,
          childAspectRatio: 6,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Ingredient(
                substance: nutrition[index].substance,
                amount: nutrition[index].amount);
          },
          childCount: nutrition.length,
        ),
      ),
    );
  }
}
