import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_text_styles.dart';
import 'package:surf_flutter_courses_template/domain/entity/photo_entity.dart';
import 'package:surf_flutter_courses_template/domain/entity/photo_state_entity.dart';

class DetailScreen extends StatefulWidget {
  final PhotoStateEntity initState;

  const DetailScreen({
    super.key,
    required this.initState,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final PageController pageController;
  late double _currentPageValue;

  /// Параметр уменьшения предыдущей и следующей фотографии
  final double scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: widget.initState.indexInitPhoto,
      viewportFraction: 0.8,
    )..addListener(_listenToPageController);
    _currentPageValue = widget.initState.indexInitPhoto.toDouble();
  }

  @override
  void dispose() {
    pageController
      ..removeListener(_listenToPageController)
      ..dispose();
    super.dispose();
  }

  void _listenToPageController() {
    double page = pageController.page ?? 0;

    setState(() {
      _currentPageValue = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final photos = widget.initState.photos;
    const sumPadding = 40 + 72;
    final heightPageView =
        MediaQuery.sizeOf(context).height - kToolbarHeight - sumPadding;

    return Scaffold(
      appBar: AppBar(
        leading: const _BackButton(),
        actions: [
          _PhotosIndicator(
            numberOfPhotos: photos.length,
            numberCurrentPhoto: _currentPageValue.round() + 1,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 72),
        child: PageView.builder(
          controller: pageController,
          itemCount: widget.initState.photos.length,
          itemBuilder: (_, index) {
            final photo = photos[index];

            /// Создание единичной матрицы для преобразования виджета
            Matrix4 matrix = Matrix4.identity();

            /// Минимальное значение масштаба страницы
            var scale = 0.8;

            /// Проверка, является ли текущая страница предыдущей, центральное или следующей
            /// по отношению к выбранной странице и высчитывает значение мастшаба для виджета.
            if (index == _currentPageValue.floor() ||
                index == _currentPageValue.floor() + 1 ||
                index == _currentPageValue.floor() - 1) {
              scale = 1 - (_currentPageValue - index).abs() * (1 - scaleFactor);
            }

            /// Вычисляет значение смещения для текущей страницы
            var transform = heightPageView * (1 - scale) / 2;

            /// Устанавливает значение диагонали матрицы, которые определяют масштаб виджета
            matrix = Matrix4.diagonal3Values(1.0, scale, 1.0)

              /// Устанавливает смещение виджета для выравнивания по центру по вертикали
              ..setTranslationRaw(0, transform, 0);

            return Transform(
              transform: matrix,
              child: _PhotoFullScreenWidget(
                  photo: photo,
                  tag: index == _currentPageValue.floor()
                      ? photo.imageUrl
                      : null),
            );
          },
        ),
      ),
    );
  }
}

class _PhotoFullScreenWidget extends StatelessWidget {
  final PhotoEntity photo;

  /// Тэг для Hero анимации. PageView у нас отображает три фотографии благодаря viewportFraction,
  /// поэтому для визуально приятной анимации тэг только на центральной фотографии
  final String? tag;

  const _PhotoFullScreenWidget({
    super.key,
    required this.photo,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final imageWidget = Image.network(
      photo.imageUrl,
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
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AspectRatio(
        aspectRatio: 1 / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: tag == null
              ? imageWidget
              : Hero(
                  tag: photo.imageUrl,
                  child: imageWidget,
                ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    void onTapBackButton() {
      Navigator.pop(context);
    }

    return Center(
      child: IconButton(
        onPressed: onTapBackButton,
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}

class _PhotosIndicator extends StatelessWidget {
  final int numberOfPhotos;
  final double numberCurrentPhoto;

  const _PhotosIndicator({
    super.key,
    required this.numberOfPhotos,
    required this.numberCurrentPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        '${numberCurrentPhoto.round()} / $numberOfPhotos',
        style: AppTextStyles.styleOfNumber,
      ),
    );
  }
}
