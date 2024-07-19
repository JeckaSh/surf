import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/presentation/theme/button_extension.dart';
import 'package:surf_flutter_courses_template/presentation/theme/input_extension.dart';

/// Темы с цветовыми схемами приложения
extension ThemeExtension on ThemeData {
  /// Базовая тема
  ThemeData get mainTheme => ThemeData(
        checkboxTheme: CheckboxExtension.mainCheckbox,
        inputDecorationTheme: InputDecorationExtension.baseTheme,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.transparent).copyWith(
          brightness: Brightness.light,
          background: AppColors.appBackground,
          primary: AppColors.red,
        ),
        useMaterial3: true,
      );
}
