import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

/// Расширение для темы  кнопок
extension ElevatedButtonsExtension on ElevatedButtonThemeData {
  /// Тема основной кнопки
  ElevatedButtonThemeData get mainButton => ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.greyText;
            }
            return AppColors.red;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.appBackground;
            }
            return AppColors.white;
          },
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ));
}

/// Расширение для темы чекбоксов
extension CheckboxExtension on CheckboxThemeData {
  /// Тема основного чекбокса
  static CheckboxThemeData get mainCheckbox => CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.red;
            }
            return AppColors.white;
          },
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      );
}
