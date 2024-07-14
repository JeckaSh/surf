import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

extension TextButtonsExtension on TextButtonThemeData {
  TextButtonThemeData get mainButton => TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.appError),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.appError),
            borderRadius: BorderRadius.circular(16.0),
          )),
        ),
      );
}

extension ElevatedButtonsExtension on ElevatedButtonThemeData {
  ElevatedButtonThemeData get mainButton => ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.appWhite),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        ),
      );
}
