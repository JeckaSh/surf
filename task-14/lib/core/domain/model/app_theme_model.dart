import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/dark_themes.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/light_themes.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/system_theme.dart';

abstract class AppThemeModel extends Equatable {
  /// id номер темы
  final int id;
  final Brightness brightness;

  const AppThemeModel({
    required this.id,
    required this.brightness,
  })  : assert(id > 0),
        assert(id < 4);

  /// Системная тема с [id] = 0,
  /// и яркостью, установленной в системе
  AppThemeModel.system()
      : id = 0,
        brightness =
            SchedulerBinding.instance.platformDispatcher.platformBrightness;

  @override
  List<Object> get props => [id, brightness];

  /// Получить информацию из темы
  ThemeData getThemeDataFromTheme(BuildContext context);

  /// Получить название типа темы
  String get getThemeTypeName;

  /// Парсинг темы в строку
  @override
  String toString() {
    final String result = '$id-${brightness.name}';
    return result;
  }

  /// Парсинг темы из строки
  static AppThemeModel fromString(String string) {
    final strings = string.split('-');
    final themeId = int.parse(strings[0]);
    final themeBrightness = Brightness.values.firstWhere(
      (b) => b.name == strings[1],
    );

    /// new switch view
    /// [_] - default значение
    final themes = switch (themeId) {
      0 => SystemTheme(),
      1 => themeBrightness == Brightness.light
          ? const LightGreenTheme()
          : const DarkGreenTheme(),
      2 => themeBrightness == Brightness.light
          ? const LightBlueTheme()
          : const DarkBlueTheme(),
      3 => themeBrightness == Brightness.light
          ? const LightOrangeTheme()
          : const DarkOrangeTheme(),
      _ => throw Exception('Unexpected theme id'),
    };

    return themes;

    // old switch
    // switch (themeId) {
    //   case 0:
    //     return SystemTheme();
    //   case 1:
    //     return themeBrightness == Brightness.light
    //         ? const LightGreenTheme()
    //         : const DarkGreenTheme();
    //   case 2:
    //     return themeBrightness == Brightness.light
    //         ? const LightBlueTheme()
    //         : const DarkBlueTheme();
    //   case 3:
    //     return themeBrightness == Brightness.light
    //         ? const LightOrangeTheme()
    //         : const LightOrangeTheme();
    //   default:
    //     throw Exception('Unexpected theme id');
    // }
  }
}
