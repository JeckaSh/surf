import 'package:surf_flutter_courses_template/domain/entity/product_entity.dart';

class ChequeEntity {
  final int id;
  final DateTime date;
  final List<ProductEntity> products;

  ChequeEntity({
    required this.id,
    required this.date,
    required this.products,
  });
}
