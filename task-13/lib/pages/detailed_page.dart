import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/domain/entity/color_entity.dart';
import 'package:surf_flutter_courses_template/domain/entity/rgb_type.dart';
import 'package:surf_flutter_courses_template/style/app_strings.dart';
import 'package:surf_flutter_courses_template/style/text_styles.dart';
import 'package:surf_flutter_courses_template/utils/extension/hex_to_color_extension.dart';

class DetailedPageWidget extends StatelessWidget {
  final ColorEntity colorData;

  const DetailedPageWidget({super.key, required this.colorData});

  @override
  Widget build(BuildContext context) {
    /// Получение размера экрана
    final height = MediaQuery.sizeOf(context).height;

    /// Половина экрана
    final colorBoxHeight = height / 2;

    /// kToolbarHeight имеет дефолтную высоту 56
    final preferredSizeHeight = colorBoxHeight - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        foregroundColor: Colors.white,
        flexibleSpace: SizedBox(
          width: double.infinity,
          height: colorBoxHeight,
          child: ColoredBox(
            color: colorData.value.hexToColor(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(preferredSizeHeight),
          child: const SizedBox.shrink(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              colorData.name,
              style: MyTextStyle.titleStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            _ShadowBoxWidget(title: AppString.hex, value: colorData.value),
            const SizedBox(
              height: 16,
            ),
            _RgbWidget(color: colorData.value.hexToColor()),
          ],
        ),
      ),
    );
  }
}

class _RgbWidget extends StatelessWidget {
  final Color color;

  const _RgbWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: RgbType.values

          /// Проход по всей коллекции, каждое значение возвращается в виджет
          .expandIndexed(
            (i, e) => [
              Expanded(
                child: _ShadowBoxWidget(
                  title: e.name,
                  value: switch (e) {
                    RgbType.red => color.red.toString(),
                    RgbType.green => color.green.toString(),
                    RgbType.blue => color.blue.toString(),
                  },
                ),
              ),
              if (i != RgbType.values.length - 1)
                const SizedBox(
                  width: 8,
                ),
            ],
          )
          .toList(),
    );
  }
}

class _ShadowBoxWidget extends StatelessWidget {
  final String title;
  final String value;

  const _ShadowBoxWidget({super.key, required this.title, required this.value});

  /// Копирование в буфер обмена
  void _onTap() async {
    await Clipboard.setData(ClipboardData(text: value));
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 12,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: _onTap,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  style: MyTextStyle.detailStyle,
                ),
              ),
              Text(value),
            ],
          ),
        ),
      ),
    );
  }
}
