import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/common/colors.dart';
import 'package:homerecipes/presentation/common/custom_divider.dart';
import 'package:homerecipes/presentation/common/line.dart';
import 'package:google_fonts/google_fonts.dart';

class PrepareStepHeading extends StatelessWidget {
  const PrepareStepHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 2.h, right: 3.w, left: 3.w),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDivider(),
                Text(
                  'Prepare your dish',
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
            )
          ],
        ),
      ),
    );
  }
}
