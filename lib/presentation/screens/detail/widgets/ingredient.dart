import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({Key? key, required this.substance, required this.amount})
      : super(key: key);
  final String substance;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 9,
          width: 9,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryWidgetColor(),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          '${substance}: ${amount}',
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryTextColor(opacity: 0.9),
          ),
        )
      ],
    );
  }
}
