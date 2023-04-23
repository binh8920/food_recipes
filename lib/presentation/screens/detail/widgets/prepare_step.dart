import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PrepareStep extends StatelessWidget {
  final int prepareStepNumber;
  final String content;
  const PrepareStep({
    Key? key,
    required this.prepareStepNumber,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(4.sp),
          decoration: BoxDecoration(
            color: AppColors.primaryWidgetColor(),
            shape: BoxShape.circle,
          ),
          child: Text(
            prepareStepNumber.toString(),
            style: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
          child: Text(
            content,
            style: GoogleFonts.inter(fontSize: 10.sp),
            overflow: TextOverflow.clip,
          ),
        )
      ],
    );
  }
}
