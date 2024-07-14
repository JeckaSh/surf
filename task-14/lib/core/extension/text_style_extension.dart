import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';

/// Расширение с textStyl'ами приложения
extension AppTextTheme on TextTheme {
  TextStyle get customTitle {
    return const TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 18.0,
      color: AppColors.appWhite,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get customNormal {
    return const TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customButton {
    return const TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customCaption {
    return const TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.appWhite,
    );
  }
}
