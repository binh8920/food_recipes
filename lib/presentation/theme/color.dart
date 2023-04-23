import 'package:flutter/material.dart';

const primary = Color(0xFFf9c920);
const secondary = Color(0xFFe96561);

const mainColor = Color(0xFF000000);
const darker = Color(0xFF3E4249);
const appBgColor = Color(0xFFF7F7F7);
const appBarColor = Color(0xFFF7F7F7);
const bottomBarColor = Colors.white;
const inActiveColor = Colors.grey;
const shadowColor = Colors.black87;
const textBoxColor = Colors.white;
const textColor = Color(0xFF333333);
const labelColor = Color(0xFF8A8989);

const actionColor = Color(0xFFe54140);
const buttonColor = Color(0xFFcdacf9);
const cardColor = Colors.white;

const yellow = Color(0xFFffcb66);
const green = Color(0xFFa2e1a6);
const pink = Color(0xFFf5bde8);
const purple = Color(0xFFcdacf9);
const red = Color(0xFFf77080);
const orange = Color(0xFFf5ba92);
const sky = Color(0xFFABDEE6);
const blue = Color(0xFF509BE4);
const cyan = Color(0xFF4ac2dc);
const darkerGreen = Color(0xFFb0d96d);

const listColors = [
  green,
  purple,
  yellow,
  orange,
  sky,
  secondary,
  red,
  blue,
  pink,
  yellow,
];

class AppColors {
  static primaryTextColor({double opacity = 1}) =>
      Color(0xFF111111).withOpacity(opacity);
  static secondaryTextColor({double opacity = 1}) =>
      Color(0xFF222222).withOpacity(opacity);
  static primaryColor({double opacity = 0.95}) =>
      Color(0xFFFFFFFF).withOpacity(opacity);
  static secondaryColor({double opacity = 1}) =>
      Color(0xFFEEEEEE).withOpacity(opacity);
  static primaryWidgetColor({double opacity = 1}) =>
      Color(0xFF2EBF8D).withOpacity(opacity);
}
