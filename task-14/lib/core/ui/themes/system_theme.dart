import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_theme_model.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/dark_themes.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/light_themes.dart';

class SystemTheme extends AppThemeModel {
  SystemTheme() : super.system();

  @override
  ThemeData getThemeDataFromTheme(BuildContext context) {
    return brightness == Brightness.light
        ? const LightGreenTheme().getThemeDataFromTheme(context)
        : const DarkGreenTheme().getThemeDataFromTheme(context);
  }

  @override
  String get getThemeTypeName => AppStrings.systemThemeTypeName;
}
