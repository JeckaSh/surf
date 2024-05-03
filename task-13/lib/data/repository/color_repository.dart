import 'package:surf_flutter_courses_template/api/service/colors_api.dart';
import 'package:surf_flutter_courses_template/data/mapper/color_mapper.dart';
import 'package:surf_flutter_courses_template/domain/entity/color_entity.dart';

/// Репозиторий для получения данных
/// Принимает [ColorsApi] для реализации метода getColors()
/// и маппер [ColorMapper] для преобразования данных
final class ColorsRepository {
  final ColorsApi _colorsApi;
  final ColorMapper _colorsMapper;

  ColorsRepository(
      {required ColorsApi colorsApi, required ColorMapper colorsMapper})
      : _colorsApi = colorsApi,
        _colorsMapper = colorsMapper;

  /// Получения списка цветов
  Future<List<ColorEntity>> getColors() =>
      _colorsApi.getColors().then(_colorsMapper.mapColors);
}
