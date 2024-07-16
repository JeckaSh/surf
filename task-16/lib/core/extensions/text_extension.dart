import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

extension CustomTextTheme on TextTheme {
  /// textStyle подсказки
  TextStyle get hintTheme {
    return const TextStyle(
      fontSize: 16.0,
      color: AppColors.appHint,
      fontWeight: FontWeight.w400,
    );
  }

  /// textStyle ответа
  TextStyle get messageTheme {
    return const TextStyle(
      fontSize: 32.0,
      color: AppColors.appText,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get errorMessage {
    return const TextStyle(
      fontSize: 32.0,
      color: AppColors.messageError,
      fontWeight: FontWeight.w400,
    );
  }
}
