import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/di/injection.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_theme_model.dart';
import 'package:surf_flutter_courses_template/core/storage/storage_interface.dart';

class AppStateModel extends ChangeNotifier {
  AppStateModel();

  /// Текущая тема
  AppThemeModel? _currentTheme;

  /// Получить текущую тему
  AppThemeModel get currentTheme {
    final theme = _currentTheme;
    if (theme != null) {
      return theme;
    }
    throw Exception('Current theme not found');
  }

  /// Установить текущую тему
  set currentTheme(AppThemeModel theme) {
    if (theme != _currentTheme) {
      _currentTheme = theme;
      injector.get<StorageInterface>().set(
            AppStrings.prefsThemeKey,
            theme.toString(),
          );
      notifyListeners();
    }
  }
}
