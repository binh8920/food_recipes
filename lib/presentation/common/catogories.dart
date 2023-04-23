import 'package:flutter/material.dart';
import 'package:homerecipes/presentation/theme/color.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import 'package:homerecipes/presentation/theme/palette.dart';

class Categories extends StatelessWidget {
  final Color color;
  final String text;
  final String images;
  const Categories(
      {Key? key, required this.color, required this.text, required this.images})
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
      padding: EdgeInsets.only(bottom: 1.h),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          //height: 10.h,
          width: 38.w,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(4.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    images,
                    height: 8.h,
                    width: 8.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: isTablet ? 0.5.w : 1.w),
                    child: Text(text, style: AppStyles.homeHeader5),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
