import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/core/domain/animals.dart';
import 'package:surf_flutter_courses_template/presentation/pages/reg_page/reg_page_widget_model.dart';
import 'package:surf_flutter_courses_template/presentation/theme/text_style_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Значение размера сторон кнопки
const double _sizeContainer = 72;

/// Виджет радио кнопки типа животного
class CustomRadioButton extends StatelessWidget {
  /// Текущее значение группы, к которой относится радио кнопка
  final int? groupValue;

  /// Тип животного относящийся к радио кнопке
  final Animals pet;

  /// Обработчик события нажатия на радиокнопку
  final ValueChanged<int> onTap;

  ///Радио кнопка типа животного
  const CustomRadioButton({
    super.key,
    required this.groupValue,
    required this.pet,
    required this.onTap,
    required Function(int index) onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final widgetModel = context.read<RegPageWidgetModel>();
    final bool isSelected = pet.index == groupValue;
    final Color color =
        isSelected ? Theme.of(context).primaryColor : AppColors.white;
    return StreamBuilder<bool>(
        stream: widgetModel.loadingStatusStream,
        builder: (_, __) {
          final loading = widgetModel.isLoading;
          return Container(
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: loading ? null : () => onTap(pet.index),
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      height: _sizeContainer,
                      width: _sizeContainer,
                      decoration: BoxDecoration(
                        color: loading ? color.withOpacity(0.24) : color,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: SizedBox.square(
                          dimension: _sizeContainer / 2,
                          child: SvgPicture.asset(
                            pet.imagePath,
                            color:
                                isSelected ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      pet.title,
                      style: CustomTextTheme.smallTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
