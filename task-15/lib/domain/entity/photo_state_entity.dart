import 'package:surf_flutter_courses_template/domain/entity/photo_entity.dart';

class PhotoStateEntity {
  final int indexInitPhoto;
  final List<PhotoEntity> photos;

  const PhotoStateEntity({
    required this.indexInitPhoto,
    required this.photos,
  });
}
