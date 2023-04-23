import 'package:flutter/material.dart';
import 'package:homerecipes/presentation/theme/color.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import 'package:homerecipes/presentation/theme/palette.dart';

class ExploreCart extends StatelessWidget {
  final String image;
  final String name;
  final String subname;
  final String userimage;
  final String username;
  final String ratings;

  const ExploreCart(
      {Key? key,
      required this.image,
      required this.name,
      required this.subname,
      required this.userimage,
      required this.username,
      required this.ratings})
      : super(key: key);

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
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Stack(
        children: [
          SizedBox(
            height: 16.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 80.sp,
                          width: 80.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    image,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 2.w, top: isTablet ? 0.h : 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 40.w,
                                              child: Text(
                                                name,
                                                style: AppStyles.explore1,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              )),
                                          Text(subname,
                                              style: AppStyles.homeHeader2sub),
                                        ],
                                      ),
                                      //const Icon(Icons.more_vert)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     CircleAvatar(
                                  //       radius: isTablet ? 26 : 18,
                                  //       backgroundImage:
                                  //           NetworkImage(userimage),
                                  //     ),
                                  //     Padding(
                                  //       padding:
                                  //           const EdgeInsets.only(left: 8.0),
                                  //       child: Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(
                                  //             username,
                                  //             style: const TextStyle(
                                  //                 fontSize: 14,
                                  //                 color: textColor),
                                  //           ),
                                  //           const Text(
                                  //             "Nutrition",
                                  //             style: TextStyle(
                                  //                 fontSize: 13,
                                  //                 color: labelColor),
                                  //           )
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 10,
              top: 20,
              child: Container(
                height: 3.h,
                width: isTablet ? 8.w : 12.w,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: isTablet ? 8.sp : 10.sp,
                        color: Colors.black,
                      ),
                      Text(
                        ratings,
                        style: TextStyle(
                          color: AppPalette.textColor,
                          fontSize: isTablet ? 8.sp : 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
