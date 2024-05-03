import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/main.dart';
import 'package:surf_flutter_courses_template/pages/detailed_page.dart';
import 'package:surf_flutter_courses_template/style/app_strings.dart';
import 'package:surf_flutter_courses_template/style/text_styles.dart';
import 'package:surf_flutter_courses_template/utils/extension/hex_to_color_extension.dart';

import '../domain/entity/color_entity.dart';

/// Главный экран
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<ColorEntity>>? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  /// Получить данные из локального репозитория
  Future<void> _load() async {
    _data = colorsRepository.getColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              AppString.title,
              maxLines: 2,
              style: MyTextStyle.titleStyle,
            ),
          ),
        ),
      ),

      /// Отображение состояний загрузки, ошибки и виджета-заглушки
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
          }),
    );
  }
}

/// Сетка цветов
class _ContentWidget extends StatelessWidget {
  final List<ColorEntity> data;

  const _ContentWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          mainAxisExtent: 160,
          crossAxisSpacing: 22),
      itemCount: data.length,
      itemBuilder: (_, i) => _ColorWidget(colorData: data[i]),
    );
  }
}

/// Виджет цветовой плитки
class _ColorWidget extends StatelessWidget {
  final ColorEntity colorData;

  const _ColorWidget({required this.colorData, super.key});

  /// Переход на экран детальной информации
  void onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => DetailedPageWidget(
              colorData: colorData,
            )));
  }

  /// Копирование в буфер обмена
  void onLongPress() async {
    await Clipboard.setData(ClipboardData(text: colorData.value));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => onTap(context),
        onLongPress: onLongPress,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(
              dimension: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colorData.value.hexToColor(),
                ),
              ),
            ),

            /// Название и код цвета
            Text(
              colorData.name,
              style: MyTextStyle.defaultStyle,
            ),
            Text(
              colorData.value,
              style: MyTextStyle.defaultStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppString.error,
        style: MyTextStyle.detailStyle,
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppString.empty,
        style: MyTextStyle.detailStyle,
      ),
    );
  }
}
