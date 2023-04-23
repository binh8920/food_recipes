import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homerecipes/data/recipe_data.dart';
import 'package:homerecipes/presentation/screens/detail/recipe_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import 'package:homerecipes/presentation/theme/palette.dart';
import 'package:homerecipes/presentation/theme/color.dart';
import 'package:homerecipes/presentation/common/catogories.dart';
import 'package:homerecipes/presentation/common/vertical_spacer.dart';
import 'package:homerecipes/presentation/screens/explore/widgets/explorecart.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);
  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  Color color = AppPalette.cardColor;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    bool isTablet;
    double ratio =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;
    if ((ratio >= 0.74) && (ratio < 1.5)) {
      isTablet = true;
    } else {
      isTablet = false;
    }

    Widget listViewTabBar(String type) {
      return FutureBuilder(
          future: ApiServices().getRecipes(type),
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
                  height: 16.h,
                  width: 90.w,
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
                                    builder: ((context) => FoodDetailsPage(
                                        name: snapshot.data[index].name,
                                        imageUrl:
                                            snapshot.data[index].thumbnailUrl,
                                        yields: snapshot.data[index].yields,
                                        steps: snapshot.data[index].instruction,
                                        nutrition:
                                            snapshot.data[index].nutrition,
                                        cookTime:
                                            snapshot.data[index].cookTime))));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 3.w,
                            ),
                            child: ExploreCart(
                                image: snapshot.data[index].thumbnailUrl,
                                name: snapshot.data[index].name,
                                subname: snapshot.data[index].country,
                                userimage:
                                    "https://images.unsplash.com/photo-1604004555489-723a93d6ce74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                                ratings:
                                    snapshot.data[index].userRatings['score'] ==
                                            'N/A'
                                        ? 'N/A'
                                        : double.parse((snapshot.data[index]
                                                        .userRatings['score'] *
                                                    5)
                                                .toStringAsFixed(1))
                                            .toString(),
                                username: "Liya"),
                          ),
                        );
                      }));
            }
          });
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore",
                  style: AppStyles.homeHeader1,
                ),
                const SizedBox(
                  height: 10,
                ),
                // SizedBox(
                //   height: isTablet ? 7.h : 6.h,
                //   child: ListView(
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       Card(
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10)),
                //         child: SizedBox(
                //           //height: 6.h,
                //           width: 90.w,
                //           child: Center(
                //             child: Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Row(
                //                 children: [
                //                   Icon(
                //                     Icons.search,
                //                     color: inActiveColor,
                //                     size: 14.sp,
                //                   ),
                //                   Padding(
                //                     padding: EdgeInsets.only(left: 10.0),
                //                     child: Text(
                //                       "Search",
                //                       style: TextStyle(
                //                         fontSize: 15,
                //                         color: inActiveColor,
                //                       ),
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                const VerticalSpacer(1.5),
                SizedBox(
                  height: 8.h,
                  child: TabBar(
                    // shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    indicatorColor: AppPalette.primary,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2,
                    indicatorPadding: EdgeInsets.only(top: 20),
                    controller: tabController,
                    isScrollable: true,
                    onTap: (value) => {color = AppPalette.primary},
                    tabs: const [
                      Categories(
                          color: cardColor,
                          text: "Breakfast",
                          images: "assets/images/ramen.png"),
                      Categories(
                          color: cardColor,
                          text: "Vegetarian",
                          images: "assets/images/salad.png"),
                      Categories(
                          color: cardColor,
                          text: "Under 30min",
                          images: "assets/images/pizza.png"),
                      Categories(
                          color: cardColor,
                          text: "Healthy",
                          images: "assets/images/hot-pot.png"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.h,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      listViewTabBar('breakfast'),
                      listViewTabBar('vegetarian'),
                      listViewTabBar('under_30_minutes'),
                      listViewTabBar('healthy'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
