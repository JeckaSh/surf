import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/entity/color_scheme_entity.dart';

List<ColorSchemeEntity> appColorSchemes = [
  ColorSchemeEntity(
    colorScheme: AppColorSchemes.lightGreenScheme,
    title: 'Схема 1',
    titleColor: Colors.green,
  ),
  ColorSchemeEntity(
    colorScheme: AppColorSchemes.lightBlueScheme,
    title: 'Схема 2',
    titleColor: Colors.blue,
  ),
  ColorSchemeEntity(
    colorScheme: AppColorSchemes.lightOrangeScheme,
    title: 'Схема 3',
    titleColor: Colors.orange,
  ),
];

enum MyColorSchemes {
  greenScheme,
  blueScheme,
  orangeScheme;
}

abstract class AppColorSchemes {
  static const lightGreenScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Colors.green,
      onPrimary: Colors.black,
      secondary: Colors.lightGreen,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      background: Colors.lightGreen,
      onBackground: Colors.black,
      surface: Colors.greenAccent,
      onSurface: Colors.black);

  static const lightBlueScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.black,
      secondary: Colors.lightBlue,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      background: Colors.lightBlue,
      onBackground: Colors.black,
      surface: Colors.blueAccent,
      onSurface: Colors.black);

  static const lightOrangeScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Colors.orange,
      onPrimary: Colors.black,
      secondary: Colors.orangeAccent,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      background: Colors.deepOrange,
      onBackground: Colors.black,
      surface: Colors.deepOrangeAccent,
      onSurface: Colors.black);

  static const darkGreenScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.green,
      onPrimary: Colors.black,
      secondary: Colors.lightGreen,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      background: Colors.lightGreen,
      onBackground: Colors.black,
      surface: Colors.greenAccent,
      onSurface: Colors.black);

  static const darkBlueScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.blue,
      onPrimary: Colors.black,
      secondary: Colors.lightBlue,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      background: Colors.lightBlueAccent,
      onBackground: Colors.black,
      surface: Colors.blueAccent,
      onSurface: Colors.black);

  static const darkOrangeScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.orange,
      onPrimary: Colors.black,
      secondary: Colors.orangeAccent,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      background: Colors.deepOrange,
      onBackground: Colors.black,
      surface: Colors.deepOrangeAccent,
      onSurface: Colors.black);
}
