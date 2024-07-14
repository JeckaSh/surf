import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/domain/circle_painter/circle_painter.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_theme_model.dart';
import 'package:surf_flutter_courses_template/core/extension/text_style_extension.dart';

class CustomSchemeRadioButtonWidget extends StatelessWidget {
  final bool isSelected;

  final String title;

  final VoidCallback callback;

  final AppThemeModel scheme;

  const CustomSchemeRadioButtonWidget({
    super.key,
    required this.isSelected,
    required this.title,
    required this.callback,
    required this.scheme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textStyle = theme.textTheme.customCaption.copyWith(
      color:
          isSelected ? theme.colorScheme.tertiary : theme.colorScheme.secondary,
    );

    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        height: 64,
        width: 103,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: theme.colorScheme.onSurface,
            border: Border.all(
              width: 1,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _SchemeColors(scheme: scheme),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  title,
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Виджет основных цветов схемы
class _SchemeColors extends StatelessWidget {
  final AppThemeModel scheme;

  const _SchemeColors({
    required this.scheme,
  });

  @override
  Widget build(BuildContext context) {
    /// Получаем данные о цветовой схеме
    final colorScheme = scheme.getThemeDataFromTheme(context).colorScheme;

    return SizedBox.square(
      dimension: 18,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: [
          _ColorCircle(
            color: colorScheme.secondary,
          ),
          _ColorCircle(
            color: colorScheme.primary,
          ),
          _ColorCircle(
            color: colorScheme.tertiary,
          ),
          _ColorCircle(
            color: colorScheme.surface,
          ),
        ],
      ),
    );
  }
}

/// Виджет цветного кружка в выборе цветовой схемы
class _ColorCircle extends StatelessWidget {
  final Color color;

  const _ColorCircle({required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 8,
      height: 8,
      child: CustomPaint(
        painter: CirclePainter(color: color, isFill: true),
        child: Container(),
      ),
    );
  }
}
