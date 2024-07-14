import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_theme_model.dart';
import 'package:surf_flutter_courses_template/core/extension/theme_extension.dart';

class LightGreenTheme extends AppThemeModel {
  const LightGreenTheme({super.id = 1, super.brightness = Brightness.light});

  @override
  ThemeData getThemeDataFromTheme(BuildContext context) {
    return Theme.of(context).lightGreenTheme;
  }

  @override
  String get getThemeTypeName => AppStrings.lightThemeTypeName;
}

class LightBlueTheme extends AppThemeModel {
  const LightBlueTheme({super.id = 2, super.brightness = Brightness.light});

  @override
  ThemeData getThemeDataFromTheme(BuildContext context) {
    return Theme.of(context).lightBlueTheme;
  }

  @override
  String get getThemeTypeName => AppStrings.lightThemeTypeName;
}

class LightOrangeTheme extends AppThemeModel {
  const LightOrangeTheme({super.id = 3, super.brightness = Brightness.light});

  @override
  ThemeData getThemeDataFromTheme(BuildContext context) {
    return Theme.of(context).lightOrangeTheme;
  }

  @override
  String get getThemeTypeName => AppStrings.lightThemeTypeName;
}
