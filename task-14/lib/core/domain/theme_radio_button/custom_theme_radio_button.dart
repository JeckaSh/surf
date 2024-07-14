import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/domain/bottom_sheet/bottom_sheet_model_view.dart';
import 'package:surf_flutter_courses_template/core/domain/circle_painter/circle_painter.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_theme_model.dart';
import 'package:surf_flutter_courses_template/core/domain/scheme_radio_button/custom_scheme_radio_button.dart';
import 'package:surf_flutter_courses_template/core/extension/text_style_extension.dart';

/// Функция обработчик нажатия на цветовую схему приложения
typedef OnSchemeTap = void Function(AppThemeModel scheme);

/// Кастомный Radio Button Widget для выбора темы приложения
class CustomThemeRadioButtonWidget extends StatelessWidget {
  final bool isSelected;

  final String title;

  final VoidCallback onThemeTypeTap;

  final OnSchemeTap onSchemeTap;

  /// Цветовые схемы, относящиеся к кнопке
  final Set<AppThemeModel>? schemes;

  const CustomThemeRadioButtonWidget({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.onSchemeTap,
    required this.onThemeTypeTap,
    this.schemes,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheetModel = Provider.of<ThemeChangerBottomSheetModel>(
      context,
      listen: false,
    );

    final theme = Theme.of(context);

    final textStyle = theme.textTheme.customButton.copyWith(
      color: theme.colorScheme.tertiary,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 56,
            child: GestureDetector(
              onTap: onThemeTypeTap,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _CustomCircleRadioButton(
                    isSelected: isSelected,
                    size: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        title,
                        style: textStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: isSelected && schemes != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: schemes!
                        .map(
                          (e) => CustomSchemeRadioButtonWidget(
                            isSelected: e == bottomSheetModel.selectedTheme,
                            title: '${AppStrings.scheme} ${e.id}',
                            callback: () => onSchemeTap(e),
                            scheme: e,
                          ),
                        )
                        .toList(),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _CustomCircleRadioButton extends StatelessWidget {
  final bool isSelected;

  final double size;

  const _CustomCircleRadioButton({
    required this.isSelected,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox.square(
      dimension: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: CirclePainter(
              color: theme.colorScheme.primary,
              isFill: isSelected,
            ),
            child: Container(),
          ),
          if (isSelected)
            SizedBox.square(
              dimension: size / 2,
              child: CustomPaint(
                painter: CirclePainter(
                  color: theme.colorScheme.surface,
                ),
                child: Container(),
              ),
            ),
        ],
      ),
    );
  }
}
