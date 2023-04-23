import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodInfos extends StatelessWidget {
  const FoodInfos(
      {Key? key,
      required this.calories,
      required this.cookTime,
      required this.yields,
      required this.name})
      : super(key: key);

  final String calories;
  final String cookTime;
  final String yields;
  final String name;

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: isTablet ? 2.h : 0.8.h),
              child: Container(
                width: 92.w,
                child: Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryTextColor(),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${calories} calories',
              style: GoogleFonts.inter(
                  color: AppColors.secondaryTextColor(opacity: 0.7),
                  fontSize: 10.sp),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.av_timer_outlined,
                  color: Color(0xFFf9c920),
                  size: 18.sp,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${cookTime} mins',
                  style: GoogleFonts.inter(
                      color: AppColors.secondaryTextColor(opacity: 0.7),
                      fontSize: 10.sp),
                ),
              ],
            ),
            SizedBox(
              width: 28.w,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.room_service_outlined,
                      color: AppColors.primaryWidgetColor(),
                      size: 18.sp,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      yields,
                      style: GoogleFonts.inter(
                          color: AppColors.secondaryTextColor(opacity: 0.7),
                          fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
