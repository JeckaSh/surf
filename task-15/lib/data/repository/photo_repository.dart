import 'package:surf_flutter_courses_template/data/mock_data.dart';
import 'package:surf_flutter_courses_template/domain/entity/photo_entity.dart';

class PhotoRepository {
  Future<List<PhotoEntity>> getPhotos() async {
    return Future.value(photos);
  }
}
