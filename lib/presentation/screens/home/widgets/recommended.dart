import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homerecipes/presentation/theme/color.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import 'package:homerecipes/presentation/theme/palette.dart';

class Recommended extends StatelessWidget {
  final String name;
  final String image;
  final String subtitle;
  final String ratings;
  const Recommended(
      {Key? key,
      required this.name,
      required this.image,
      required this.subtitle,
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
      children: [
        Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            height: isTablet ? 15.h : 13.h,
            width: 90.w,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Container(
                    height: 60.sp,
                    width: 60.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50.w,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 1.h,
                                    top: isTablet ? 0 : 1.h,
                                    right: 6.w),
                                child: Text(
                                  name,
                                  style: AppStyles.homeHeader4,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                            Row(children: [
                              Text(subtitle, style: AppStyles.homeHeader2sub),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 18.sp,
                                  width: 35.sp,
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 11.sp,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          ratings,
                                          style: AppStyles.homeHeader3sub,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: isTablet ? 10.sp : 3.h,
            right: 10.sp,
            child: Container(
                height: 18.sp,
                width: 18.sp,
                child: Center(
                    child: SvgPicture.asset(
                  "assets/icons/bookmark.svg",
                  height: 22.sp,
                  width: 22.sp,
                  color: primary,
                ))))
      ],
    );
  }
}
