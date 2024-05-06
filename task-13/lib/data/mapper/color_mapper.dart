import '../../api/data/color_data.dart';
import '../../domain/entity/color_entity.dart';

/// Маппер (преобразователь) сущностей
final class ColorMapper {
  /// Маппер для списка цветов
  List<ColorEntity> mapColors(List<ColorData> data) {
    final mappedList = <ColorEntity>[];
    for (var e in data) {
      final entity = _mapColor(e);
      if (entity != null) mappedList.add(entity);
    }
    return mappedList;
  }

  /// Маппер в [ColorEntity] из [ColorData]
  ColorEntity? _mapColor(ColorData data) {
    final value = data.value;

    /// Если value пусто - ничего не возвращаем
    if (value == null) return null;

    /// иначе возвращаем сущность
    return ColorEntity(
      name: data.name,
      value: value,
    );
  }
}
