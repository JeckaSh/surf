import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:surf_flutter_courses_template/assets/theme/color_schemes.dart';
import 'package:surf_flutter_courses_template/data/theme/theme_repository.dart';
// import 'package:surf_flutter_courses_template/domain/entity/color_scheme_entity.dart';

class ThemeController {
  final ThemeRepository _themeRepository;

  ThemeController({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  /// [ValueNotifier] - паттерн наблюдатель во Flutter.
  /// Получить сохранённое значение [ThemeMode] или
  /// поставить [ThemeMode.system] по умолчанию.
  late final ValueNotifier<ThemeMode> _themeMode = ValueNotifier<ThemeMode>(
    _themeRepository.getThemeMode() ?? ThemeMode.system,
  );

  // late final ValueNotifier<MyColorSchemes> _colorScheme = ValueNotifier<MyColorSchemes>();

  ValueListenable<ThemeMode> get themeMode => _themeMode;
  // ValueListenable<MyColorSchemes> get colorScheme => _colorScheme;

  /// Переопределение метода [setThemeMode] для контроллера.
  /// Если [newThemeMode] == текущему значение темы => return,
  /// иначе [newThemeMode] становится новым текущим значением.
  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode.value) return;

    await _themeRepository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }

  // Future<void> setColorScheme(MyColorSchemes newColorScheme) async {
  //   if (newColorScheme == _them)

  //   await _themeRepository.setColorScheme(newColorScheme);
  // }
}
