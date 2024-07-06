import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/domain/entity/theme_entity.dart';

List<ThemeEntity> appThemes = [
  ThemeEntity(
    mode: ThemeMode.system,
    title: AppStrings.systemTheme,
  ),
  ThemeEntity(
    mode: ThemeMode.light,
    title: AppStrings.lightTheme,
  ),
  ThemeEntity(
    mode: ThemeMode.dark,
    title: AppStrings.darkTheme,
  ),
];
