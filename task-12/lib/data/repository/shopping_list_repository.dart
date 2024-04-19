import 'package:surf_flutter_courses_template/data/mock_date.dart';
import 'package:surf_flutter_courses_template/domain/entity/cheque_entity.dart';

/// repository for get mock date
class ShoppingListRepository {
  /// get cheque from id
  Future<ChequeEntity> getCheque(int id) async {
    return Future.value(
      ChequeEntity(
          id: id,
          date: DateTime(2024, 2, 23, 12, 23),
          products: dataForStudents),
    );
  }
}
