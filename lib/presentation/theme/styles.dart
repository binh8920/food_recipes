import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'palette.dart';

abstract class AppStyles {
  const AppStyles._();

  static bool deviceTablet = SizerUtil.deviceType == DeviceType.tablet;

  static const montserratRegularFontFamily = "Montserrat";
  static const notoSansRegularFontFamily = "Noto Sans";
  static const poppinsRegularFontFamily = "Poppins";

  static final mainHeadlineColor18spw700PoppinsLineHeight = TextStyle(
    color: AppPalette.mainHeadlineColor,
    fontSize: 20.sp,
    height: 1.8,
    letterSpacing: 1.3,
    fontWeight: FontWeight.bold,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainHeadlineColor17spw700PoppinsLineHeight = TextStyle(
    color: AppPalette.mainHeadlineColor,
    fontSize: 17.sp,
    height: 1.5,
    fontWeight: FontWeight.bold,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainHeadlineColor12spw700MontserratLineHeight = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: AppPalette.mainHeadlineColor,
  );

  static final mainHeadlineColor14spw700Montserrat = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppPalette.mainHeadlineColor,
  );

  static final mainHeadlineColor18spw700Montserrat = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppPalette.mainHeadlineColor,
  );

  static final mainBlackColor14spw600Montserrat = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppPalette.mainBlackColor,
  );

  static final mainBlackColor12spw700Montserrat = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppPalette.mainBlackColor,
  );

  static final mainBlackColor11spw600Montserrat = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: AppPalette.mainBlackColor,
  );

  static final whiteColor11spw600Montserrat = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
    color: AppPalette.whiteColor,
  );

  static final secondaryGreyColor14spw600Montserrat = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppPalette.secondaryGreyColor,
  );

  static final secondaryGreyColor13spw700Montserrat = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    color: AppPalette.secondaryGreyColor,
  );

  static final mainHeadlineColor17spw700Poppins = TextStyle(
    color: AppPalette.mainHeadlineColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: poppinsRegularFontFamily,
  );

  static final history2 = TextStyle(
    color: AppPalette.orange,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    fontFamily: poppinsRegularFontFamily,
  );

  static final greyColorShade40012spw500PoppinsLineHeight = TextStyle(
    color: AppPalette.thirdGreyColor,
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsRegularFontFamily,
  );

  static final greyColorShade40011spw500PoppinsLineHeight = TextStyle(
    color: AppPalette.secondaryGreyColor,
    fontSize: 11.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsRegularFontFamily,
  );

  static final greyColorShade40012spw500NotoSansLineHeight = TextStyle(
    color: AppPalette.secondaryGreyColor,
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
    fontFamily: notoSansRegularFontFamily,
  );

  static final greyColorShade50011spw500NotoSansLineHeight = TextStyle(
    color: AppPalette.openGreyColor,
    fontSize: 11.sp,
    height: 1.5,
    fontWeight: FontWeight.w600,
    fontFamily: notoSansRegularFontFamily,
  );

  static final secondaryGreyColor12spw700Poppins = TextStyle(
    color: Colors.blueGrey,
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
    fontFamily: poppinsRegularFontFamily,
  );

  static final history1 = TextStyle(
    color: Colors.blueGrey,
    fontSize: 10.sp,
    fontFamily: poppinsRegularFontFamily,
  );

  static final quotesFocus = TextStyle(
    color: Colors.grey,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    fontFamily: poppinsRegularFontFamily,
  );

  static final secondaryGreyColor10spw700Poppins = TextStyle(
    color: AppPalette.secondaryGreyColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
    fontFamily: poppinsRegularFontFamily,
  );

  static final secondaryGreyColor10spw600Poppins = TextStyle(
    color: AppPalette.secondaryGreyColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainPurpleColor14spw600Poppins = TextStyle(
      color: AppPalette.mainPurpleColor,
      fontFamily: poppinsRegularFontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 14.sp);

  static final mainPurpleColor12spw600Poppins = TextStyle(
      color: AppPalette.mainPurpleColor,
      fontFamily: poppinsRegularFontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 12.sp);

  static final whiteColor14spw700NotoSans = TextStyle(
      color: AppPalette.whiteColor,
      fontFamily: notoSansRegularFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static final whiteColor12spw700NotoSans = TextStyle(
      color: AppPalette.whiteColor,
      fontFamily: notoSansRegularFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 12.sp);

  static final whiteColor12spw700Montserrat = TextStyle(
      color: AppPalette.whiteColor,
      fontFamily: montserratRegularFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 12.sp);

  static final whiteColor11spw700NotoSans = TextStyle(
      color: AppPalette.whiteColor,
      fontFamily: notoSansRegularFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 11.sp);

  static final whiteColor12spw600MontserratLineHeight = TextStyle(
    color: AppPalette.whiteColor,
    fontFamily: montserratRegularFontFamily,
    fontSize: 14.sp,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static final explore1 = TextStyle(
    fontFamily: poppinsRegularFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppPalette.textColor,
  );

  static final homeHeader1 = TextStyle(
    color: AppPalette.textColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: poppinsRegularFontFamily,
  );

  static final homeHeader1sub = TextStyle(
    color: AppPalette.primary,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: poppinsRegularFontFamily,
  );

  static final homeHeader2sub = TextStyle(
    color: Colors.grey,
    fontSize: 9.sp,
    fontFamily: notoSansRegularFontFamily,
  );

  static final homeHeader3sub = TextStyle(
    color: AppPalette.textColor,
    fontSize: 8.sp,
    fontFamily: notoSansRegularFontFamily,
  );

  static final homeHeader4sub = TextStyle(
    color: AppPalette.labelColor,
    fontSize: 8.sp,
    fontFamily: notoSansRegularFontFamily,
  );

  static final homeHeader2 = TextStyle(
    color: AppPalette.textColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: montserratRegularFontFamily,
  );

  static final homeHeader5 = TextStyle(
    color: AppPalette.textColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
    fontFamily: poppinsRegularFontFamily,
  );

  static final homeHeader6 = TextStyle(
    color: AppPalette.textColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: montserratRegularFontFamily,
  );

  static final homeHeader7 = TextStyle(
    color: AppPalette.textColor,
    fontSize: 9.sp,
    fontWeight: FontWeight.w400,
    fontFamily: poppinsRegularFontFamily,
  );

  static final homeHeader4 = TextStyle(
    color: AppPalette.textColor,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    fontFamily: poppinsRegularFontFamily,
  );

  static const emojisSelectionGridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6, crossAxisSpacing: 20, mainAxisSpacing: 20);

  static final horizontal6wPadding = EdgeInsets.symmetric(horizontal: 6.w);

  static final all6wPadding = EdgeInsets.all(6.w);

  static EdgeInsets onlyHorizontalPadding(double horizontal) =>
      EdgeInsets.symmetric(horizontal: horizontal);

  static EdgeInsets onlyVerticalPadding(double vertical) =>
      EdgeInsets.symmetric(vertical: vertical);

  static EdgeInsets horizontalVerticalPadding(
          double horizontal, double vertical) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  static const modalBottomSheetShapeDecorationStyle = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40.0),
      topRight: Radius.circular(40.0),
    ),
  );
}
