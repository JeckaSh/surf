import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/assets/theme/color_schemes.dart';
// import 'package:surf_flutter_courses_template/domain/entity/color_scheme_entity.dart';

// todo: сохранение по title в ThemeEntity

class ThemeStorage {
  final SharedPreferences _prefs;

  ThemeStorage({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  /// Получение сохранённой темы из [SharedPreferences] по [String] ключу.
  /// Проверка, если ничего не сохранено - возвращает null,
  /// иначе [themeMode] = сохранённое значени [storedMode]
  ThemeMode? getThemeMode() {
    final storedMode = _prefs.getString(ThemeStorageKeys.mode.key);

    if (storedMode?.isEmpty ?? true) return null;

    return ThemeMode.values.firstWhereOrNull(
      (themeMode) => themeMode.name == storedMode,
    );
  }

  // fix: ColorScheme.values отсутствует

  // ColorScheme? getColorScheme() {
  //   final storedScheme = _prefs.getString(ThemeStorageKeys.scheme.key);

  //   if (storedScheme?.isEmpty ?? true) return null;
  //   return ColorScheme.values.firstWhereOrNull(
  //     (colorScheme) => colorScheme.name == storedScheme,
  //   );
  // }

  /// Сохранение [ThemeMode] по [String] ключу
  Future<void> saveThemeMode({
    required ThemeMode mode,
  }) {
    return _prefs.setString(
      ThemeStorageKeys.mode.key,
      mode.name,
    );
  }

  Future<void> saveColorScheme({
    required MyColorSchemes scheme,
  }) {
    return _prefs.setString(
      ThemeStorageKeys.scheme.key,
      scheme.name,
    );
  }
}

enum ThemeStorageKeys {
  mode('theme_mode'),
  scheme('color_scheme');

  final String key;

  const ThemeStorageKeys(this.key);
}
