import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

/// Основное семейство шрифтов
const String _family = 'SF Pro Display';

extension CustomTextTheme on TextTheme {
  /// textStyle типа животного под иконкой
  static TextStyle get smallTextStyle {
    return const TextStyle(
      fontFamily: _family,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.darkText,
    );
  }

  /// textStyle ошибки валидации
  static TextStyle get smallErrorTextStyle {
    return const TextStyle(
      fontFamily: _family,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.red,
    );
  }

  /// textStyle неактивного textField поля
  static TextStyle get titleTextFieldTextStyle {
    return const TextStyle(
      fontFamily: _family,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColors.greyText,
    );
  }

  /// textStyle ошибки валидации textField поля
  static TextStyle get textFieldErrorTextStyle {
    return const TextStyle(
      fontFamily: _family,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColors.red,
    );
  }

  /// textStyle подсказки textField поля
  static TextStyle get smallTextFieldTextStyle {
    return const TextStyle(
      fontFamily: _family,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.greyText,
    );
  }

  /// textStyle checkbox'са и активного поля textField
  static TextStyle get mainTextStyle {
    return const TextStyle(
      fontFamily: _family,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColors.darkText,
    );
  }

  /// textStyle большого заголовка
  static TextStyle get bigTextStyle {
    return const TextStyle(
      fontFamily: _family,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: AppColors.darkText,
    );
  }

  /// textStyle неактивной кнопки
  static TextStyle get inactiveButtonTextStyle {
    return const TextStyle(
      fontFamily: _family,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: AppColors.darkGrey,
    );
  }

  /// textStyle активной кнопки
  static TextStyle get activeButtonTextStyle {
    return const TextStyle(
      fontFamily: _family,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: AppColors.white,
    );
  }
}
