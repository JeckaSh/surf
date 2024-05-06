import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/style/app_colors.dart';

abstract class MyTextStyle {
  static const titleStyle = TextStyle(
    color: AppColors.textColor,
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w700,
    fontSize: 30,
    height: 1,
  );

  static const detailStyle = TextStyle(
      color: AppColors.textColor,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
      fontSize: 16);

  static const defaultStyle = TextStyle(
      color: AppColors.textColor,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
      fontSize: 12);
}
