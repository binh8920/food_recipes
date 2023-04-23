import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homerecipes/presentation/theme/color.dart';
import 'package:homerecipes/presentation/theme/palette.dart';

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 15.w),
      child: Container(
        height: 1.h,
        width: 12.w,
        decoration: BoxDecoration(
          color: AppPalette.primary,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
