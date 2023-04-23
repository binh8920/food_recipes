import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/common/colors.dart';
import 'package:homerecipes/presentation/common/line.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientsHeading extends StatelessWidget {
  const IngredientsHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutrition',
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryTextColor(),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Line(),
      ],
    );
  }
}
