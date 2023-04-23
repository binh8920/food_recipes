import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import 'package:homerecipes/presentation/theme/palette.dart';
import 'package:homerecipes/presentation/screens/detail/detail_screen.dart';
import 'package:homerecipes/presentation/screens/detail/recipe_detail_screen.dart';
import 'package:homerecipes/presentation/common/catogories.dart';
import 'package:homerecipes/presentation/common/line.dart';
import 'package:homerecipes/presentation/common/vertical_spacer.dart';
import 'package:homerecipes/presentation/screens/home/widgets/popular.dart';
import 'package:homerecipes/presentation/screens/home/widgets/recommended.dart';
import 'package:homerecipes/data/recipe_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet;
    double ratio =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;
    if ((ratio >= 0.74) && (ratio < 1.5)) {
      isTablet = true;
    } else {
      isTablet = false;
    }

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
              children: [
                const VerticalSpacer(1),
                Text(
                  "Stay at home,",
                  style: AppStyles.homeHeader1,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "make your own ",
                    style: AppStyles.homeHeader1,
                  ),
                  TextSpan(
                    text: "food",
                    style: AppStyles.homeHeader1sub,
                  )
                ])),
                const VerticalSpacer(1),
                Line(),
                const VerticalSpacer(1.5),
                Text(
                  "Popular Recipes",
                  style: AppStyles.homeHeader2,
                ),
                const VerticalSpacer(1),
                Line(),
                const VerticalSpacer(1.5),
                FutureBuilder(
                    future: ApiServices().getRecipes('keto'),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      //List<Widget>? children;
                      if (!snapshot.hasData) {
                        return SizedBox(
                          height: 28.h,
                          child: const Center(
                              child: CircularProgressIndicator(
                            color: AppPalette.primary,
                          )),
                        );
                      } else {
                        return SizedBox(
                            height: 28.h,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  FoodDetailsPage(
                                                      name: snapshot
                                                          .data[index].name,
                                                      imageUrl: snapshot
                                                          .data[index]
                                                          .thumbnailUrl,
                                                      yields: snapshot
                                                          .data[index].yields,
                                                      steps: snapshot
                                                          .data[index]
                                                          .instruction,
                                                      nutrition: snapshot
                                                          .data[index]
                                                          .nutrition,
                                                      cookTime: snapshot
                                                          .data[index]
                                                          .cookTime))));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 3.w, bottom: 1.h),
                                      child: PopularCart(
                                        images:
                                            snapshot.data[index].thumbnailUrl,
                                        name: snapshot.data[index].name,
                                        userimage:
                                            "https://cdn.pixabay.com/photo/2021/08/07/22/30/verified-6529507_960_720.png",
                                        ratings: snapshot.data[index]
                                                    .userRatings['score'] ==
                                                'N/A'
                                            ? 'N/A'
                                            : double.parse((snapshot.data[index]
                                                                .userRatings[
                                                            'score'] *
                                                        5)
                                                    .toStringAsFixed(1))
                                                .toString(),
                                      ),
                                    ),
                                  );
                                }));
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Recommended Recipes",
                  style: AppStyles.homeHeader2,
                ),
                const VerticalSpacer(1),
                Line(),
                const VerticalSpacer(1.5),
                FutureBuilder(
                    future: ApiServices().getRecipes('spring'),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      //List<Widget>? children;
                      if (!snapshot.hasData) {
                        return SizedBox(
                          height: 28.h,
                          child: const Center(
                              child: CircularProgressIndicator(
                            color: AppPalette.primary,
                          )),
                        );
                      } else {
                        return SizedBox(
                            height: 40.h,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  FoodDetailsPage(
                                                      name: snapshot
                                                          .data[index].name,
                                                      imageUrl: snapshot
                                                          .data[index]
                                                          .thumbnailUrl,
                                                      yields: snapshot
                                                          .data[index].yields,
                                                      steps: snapshot
                                                          .data[index]
                                                          .instruction,
                                                      nutrition: snapshot
                                                          .data[index]
                                                          .nutrition,
                                                      cookTime: snapshot
                                                          .data[index]
                                                          .cookTime))));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 3.w, bottom: 1.h),
                                      child: Recommended(
                                          name: snapshot.data[index].name,
                                          image:
                                              snapshot.data[index].thumbnailUrl,
                                          subtitle: "Recommended",
                                          ratings: snapshot.data[index]
                                                      .userRatings['score'] ==
                                                  'N/A'
                                              ? 'N/A'
                                              : double.parse((snapshot
                                                                  .data[index]
                                                                  .userRatings[
                                                              'score'] *
                                                          5)
                                                      .toStringAsFixed(1))
                                                  .toString()),
                                    ),
                                  );
                                }));
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
