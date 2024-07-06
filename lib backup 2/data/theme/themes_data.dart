import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/theme/color_schemes.dart';

abstract class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColorSchemes.lightGreenScheme,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColorSchemes.darkBlueScheme,
  );
}
