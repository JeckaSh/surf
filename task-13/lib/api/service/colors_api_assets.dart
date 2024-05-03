import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/api/colors_api_urls.dart';

import '../data/color_data.dart';
import 'colors_api.dart';

/// Реализация [ColorsApi] через локальный ассет
class ColorApiAssets implements ColorsApi {
  @override
  Future<List<ColorData>> getColors() async {
    final colors = <ColorData>[];

    await _addDelay(1500);
    final jsonString = await _loadAsset(ColorApiUrls.colors);

    /// Встроенный метод для превращения строки в мапу
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    /// Превращаем данные в список мап по ключу 'colors'
    final colorsData = data['colors'] as List;

    /// Добавляем в список элементы
    if (colorsData.isNotEmpty) {
      for (final e in colorsData) {
        colors.add(ColorData.fromJson(e as Map<String, dynamic>));
      }
    }

    return colors;
  }
}

/// Загрузка строки из asset файла приложения
Future<String> _loadAsset(String path) => rootBundle.loadString(path);

/// Имитация загрузки (задержки)
Future<void> _addDelay(int ms) =>
    Future<void>.delayed(Duration(milliseconds: ms));
