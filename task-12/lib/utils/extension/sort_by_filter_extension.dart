import 'package:surf_flutter_courses_template/domain/entity/product_entity.dart';
import 'package:surf_flutter_courses_template/domain/entity/sorting_type.dart';

extension ProductListSort on List<ProductEntity> {
  /// Расширение для сортировки списка типа [ProductEntity],
  /// которое принимает список сортировок
  List<ProductEntity> sortByFilter(SortingType type) {
    final List<ProductEntity> sortedList = switch (type) {
      SortingType.none => this,
      SortingType.nameFromA => _sortByName(this),
      SortingType.nameFromZ => _sortByName(this, isFromA: false),
      SortingType.ascendingOrder => _sortByPrice(this),
      SortingType.descindingOrder => _sortByPrice(this, isAscending: false),
      SortingType.typeFromA => this,
      SortingType.typeFromZ => this,
    };

    return sortedList;
  }
}

/// Изначально от дешевого к дорогому
List<ProductEntity> _sortByPrice(List<ProductEntity> initialList,
    {bool isAscending = true}) {
  final result = initialList;

  result.sort(
    (a, b) => isAscending
        ? a.decimalPrice.compareTo(b.decimalPrice)
        : b.decimalPrice.compareTo(a.decimalPrice),
  );

  return result;
}

/// Сортировка по имени
/// Изначально от А до Я
List<ProductEntity> _sortByName(List<ProductEntity> initialList,
    {bool isFromA = true}) {
  final result = initialList;

  result.sort(
    (a, b) => isFromA ? a.title.compareTo(b.title) : b.title.compareTo(a.title),
  );

  return result;
}
