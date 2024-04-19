import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/style/colors.dart';

abstract class MyButtonStyles {
  static var bigGreenButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(MyAppColors.appBarColorSelected),
    minimumSize: MaterialStateProperty.all(
      const Size(1000, 50),
    ),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
  );
  static var sortButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(MyAppColors.sortButtonColor),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));
}
