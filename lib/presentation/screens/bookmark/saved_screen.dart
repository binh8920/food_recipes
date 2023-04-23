import 'package:flutter/material.dart';
import 'package:homerecipes/presentation/common/line.dart';
import 'package:homerecipes/presentation/common/vertical_spacer.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import './widgets/recipe_grid.dart';
import 'package:sizer/sizer.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const VerticalSpacer(1),
                Text(
                  "Your favorite",
                  style: AppStyles.homeHeader1,
                ),
                Text(
                  "recipes",
                  style: AppStyles.homeHeader1sub,
                ),
                const VerticalSpacer(1),
                Line(),
                const VerticalSpacer(2),
                SizedBox(height: 85.h, child: RecipeGrid()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
