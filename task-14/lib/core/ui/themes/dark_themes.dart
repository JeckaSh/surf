import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_theme_model.dart';
import 'package:surf_flutter_courses_template/core/extension/theme_extension.dart';

class DarkGreenTheme extends AppThemeModel {
  const DarkGreenTheme({super.id = 1, super.brightness = Brightness.dark});

  @override
  ThemeData getThemeDataFromTheme(BuildContext context) {
    return Theme.of(context).darkGreenTheme;
  }

  @override
  String get getThemeTypeName => AppStrings.darkThemeTypeName;
}

class DarkBlueTheme extends AppThemeModel {
  const DarkBlueTheme({super.id = 2, super.brightness = Brightness.dark});

  @override
  ThemeData getThemeDataFromTheme(BuildContext context) {
    return Theme.of(context).darkBlueTheme;
  }

  @override
  String get getThemeTypeName => AppStrings.darkThemeTypeName;
}

class DarkOrangeTheme extends AppThemeModel {
  const DarkOrangeTheme({super.id = 3, super.brightness = Brightness.dark});

  @override
  ThemeData getThemeDataFromTheme(BuildContext context) {
    return Theme.of(context).darkOrangeTheme;
  }

  @override
  String get getThemeTypeName => AppStrings.darkThemeTypeName;
}
