import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_state_model.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_theme_model.dart';
import 'package:surf_flutter_courses_template/core/domain/model/base_widget_model.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/dark_themes.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/light_themes.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/system_theme.dart';

class ThemeChangerBottomSheetModel extends BaseWidgetModel {
  late final AppStateModel _state;

  ThemeChangerBottomSheetModel({required AppStateModel state}) : _state = state;

  /// Глобальное состояние приложения
  AppStateModel get appState => _state;

  late AppThemeModel selectedTheme;

  Set<AppThemeModel> lightSchemes = {
    const LightGreenTheme(),
    const LightBlueTheme(),
    const LightOrangeTheme(),
  };

  Set<AppThemeModel> darkSchemes = {
    const DarkGreenTheme(),
    const DarkBlueTheme(),
    const DarkOrangeTheme(),
  };

  /// Список тем
  List<ThemeType> themeTypes = [];

  /// ThemeTypes геттеры какая в данный момент выбрана тема для списка тем
  bool get _isSystemTheme => selectedTheme is SystemTheme;
  bool get _isLightTheme =>
      selectedTheme is! SystemTheme &&
      selectedTheme.brightness == Brightness.light;
  bool get _isDarkTheme =>
      selectedTheme is! SystemTheme &&
      selectedTheme.brightness == Brightness.dark;

  void _addThemeTypes() {
    themeTypes.add(
      ThemeType(
          isSelected: _isSystemTheme, title: AppStrings.systemThemeTypeName),
    );
    themeTypes.add(
      ThemeType(
        isSelected: _isLightTheme,
        title: AppStrings.lightThemeTypeName,
        schemes: lightSchemes,
      ),
    );
    themeTypes.add(
      ThemeType(
        isSelected: _isDarkTheme,
        title: AppStrings.darkThemeTypeName,
        schemes: darkSchemes,
      ),
    );
  }

  /// Присваиваем выбранной темой текущую и заполняем список тем
  @override
  void init() {
    selectedTheme = _state.currentTheme;
    _addThemeTypes();
    // ignore: avoid_print
    print('init current theme is: ${_state.currentTheme}');
  }

  @override
  void dispose() {
    // ignore: avoid_print
    print('dispose');
  }

  void saveTheme() {
    _state.currentTheme = selectedTheme;
    // ignore: avoid_print
    print('save theme');
  }

  void onSchemeTap(AppThemeModel scheme) {
    selectedTheme = scheme;
    // ignore: avoid_print
    print('tap on scheme');
  }

  void onThemeTypeTap(int i) {
    for (var e in themeTypes) {
      e.isSelected = false;
    }
    themeTypes[i].isSelected = true;
    if (i == 0) {
      selectedTheme = SystemTheme();
    }
    if (i == 1 && selectedTheme.brightness != Brightness.light) {
      selectedTheme = lightSchemes.first;
    }
    if (i == 2 && selectedTheme.brightness != Brightness.dark) {
      selectedTheme = darkSchemes.first;
    }
    // ignore: avoid_print
    print('on theme type tap');
  }
}

/// Модель темы, содержащая данные, выбрана ли тема, её название
/// и список цветовых схем, относящишся к ней
class ThemeType {
  bool isSelected;

  final String title;

  final Set<AppThemeModel>? schemes;

  ThemeType({
    required this.isSelected,
    required this.title,
    this.schemes,
  });
}
