import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import 'package:homerecipes/presentation/theme/palette.dart';
import 'package:homerecipes/presentation/theme/color.dart';
import 'package:homerecipes/presentation/common/vertical_spacer.dart';

class PopularCart extends StatelessWidget {
  final String images;
  final String name;
  final String userimage;
  final String ratings;
  const PopularCart(
      {Key? key,
      required this.images,
      required this.name,
      required this.userimage,
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 28.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image:
                DecorationImage(image: NetworkImage(images), fit: BoxFit.cover),
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: Container(
                height: 14.sp,
                width: 14.sp,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: SvgPicture.asset(
                  "assets/icons/bookmark.svg",
                  height: 12.sp,
                  width: 12.sp,
                  color: primary,
                )))),
        Positioned(
            bottom: 10.sp,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Container(
                  height: 10.h,
                  width: MediaQuery.of(context).size.width * 0.52,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor(),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: AppStyles.homeHeader6),
                          isTablet ? VerticalSpacer(2) : VerticalSpacer(1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 16,
                                    backgroundImage: NetworkImage(userimage),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Popular",
                                          style: TextStyle(
                                              fontSize: 16, color: textColor),
                                        ),
                                        Text(
                                          "Nutrition",
                                          style: TextStyle(
                                              fontSize: 14, color: labelColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.black,
                                      ),
                                      Text(ratings)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
