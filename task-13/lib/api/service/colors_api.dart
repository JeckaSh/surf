import 'package:surf_flutter_courses_template/api/data/color_data.dart';

/// Интерфейс для API
abstract class ColorsApi {
  /// Абстрактный метод для получения цветов
  Future<List<ColorData>> getColors();
}
