import 'package:json_annotation/json_annotation.dart';

part 'color_data.g.dart';

/// Использование пакета для генерации метода .fromJson
@JsonSerializable(createToJson: false)
class ColorData {
  final String name;
  final String? value;

  ColorData(this.name, this.value);

  /// Метод для получения [ColorData] из json файлов
  factory ColorData.fromJson(Map<String, dynamic> json) =>
      _$ColorDataFromJson(json);
}
