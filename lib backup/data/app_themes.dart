import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/domain/entity/theme_model.dart';

List<ThemeModel> appThemes = [
  ThemeModel(
    mode: ThemeMode.light,
    title: AppStrings.lightTheme,
  ),
  ThemeModel(
    mode: ThemeMode.dark,
    title: AppStrings.darkTheme,
  ),
  ThemeModel(
    mode: ThemeMode.system,
    title: AppStrings.systemTheme,
  ),
];
