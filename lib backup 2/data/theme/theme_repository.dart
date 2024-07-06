import 'package:flutter/material.dart';
// import 'package:surf_flutter_courses_template/assets/theme/color_schemes.dart';
// import 'package:surf_flutter_courses_template/domain/entity/color_scheme_entity.dart';
import 'package:surf_flutter_courses_template/storage/theme/theme_storage.dart';

class ThemeRepository {
  final ThemeStorage _themeStorage;

  ThemeRepository({
    required ThemeStorage themeStorage,
  }) : _themeStorage = themeStorage;

  /// Установить для [ThemeMode] значение [newThemeMode]
  Future<void> setThemeMode(
    ThemeMode newThemeMode,
  ) async {
    await _themeStorage.saveThemeMode(
      mode: newThemeMode,
    );
  }

  // Future<void> setColorScheme(
  //   MyColorSchemes newColorScheme,
  // ) async {
  //   await _themeStorage.saveColorScheme(
  //     scheme: newColorScheme,
  //   );
  // }

  /// Получение из хранилища значение [ThemeMode]
  ThemeMode? getThemeMode() {
    return _themeStorage.getThemeMode();
  }
}
