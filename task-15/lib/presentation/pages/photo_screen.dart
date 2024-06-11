import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_images.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/domain/entity/photo_entity.dart';
import 'package:surf_flutter_courses_template/domain/entity/photo_state_entity.dart';
import 'package:surf_flutter_courses_template/main.dart';
import 'package:surf_flutter_courses_template/presentation/pages/detail_screen.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  Future<List<PhotoEntity>>? _data;

  @override
  void initState() {
    _load();
    super.initState();
  }

  Future<void> _load() async {
    /// имитация загрузки
    //await Future.delayed(const Duration(seconds: 1));
    _data = repository.getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.logo),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: _data,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const _ErrorWidget();
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return data != null
                  ? _ContentWidget(data: data)
                  : const _EmptyWidget();
            }
          }

          return const _LoadingWidget();
        },
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  final List<PhotoEntity> data;

  const _ContentWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,

        // для квадратных изображений
        childAspectRatio: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 3,
      ),
      itemCount: data.length,
      itemBuilder: (_, i) => _PhotoWidget(
        indexSelectedPhoto: i,
        photoList: data,
      ),
    );
  }
}

class _PhotoWidget extends StatelessWidget {
  final int indexSelectedPhoto;
  final List<PhotoEntity> photoList;

  const _PhotoWidget({
    required this.indexSelectedPhoto,
    required this.photoList,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = photoList[indexSelectedPhoto].imageUrl;

    void onTap(BuildContext context, {required int indexInitPhoto}) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => DetailScreen(
            initState: PhotoStateEntity(
              indexInitPhoto: indexInitPhoto,
              photos: photoList,
            ),
          ),
        ),
      );
    }

    return Center(
      child: GestureDetector(
        onTap: () => onTap(context, indexInitPhoto: indexSelectedPhoto),

        /// Для одинакового(квадратного) соотношения сторон aspect ratio = 1
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  /// отображение статуса загрузки изображения
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (_, error, stackTrace) => const Center(
                child: Text(AppStrings.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.empty),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.error),
    );
  }
}
