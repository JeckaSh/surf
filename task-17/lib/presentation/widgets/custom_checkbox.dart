import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/entity/input_types.dart';
import 'package:surf_flutter_courses_template/presentation/pages/reg_page/reg_page_widget_model.dart';
import 'package:surf_flutter_courses_template/presentation/theme/text_style_extension.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/custom_text_field.dart';

/// Виджет базового чекбокса
class CustomCheckBox extends StatefulWidget {
  /// Заголовок чекбокса
  final String title;

  /// Состояние чекбокса
  final bool isSelected;

  /// Контроллер для появляющегося поля ввода данных
  final TextEditingController controller;

  /// Базовый чекбокс
  const CustomCheckBox(
      {super.key,
      this.isSelected = false,
      required this.title,
      required this.controller});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

/// Состояние базового чекбокса
class _CustomCheckBoxState extends State<CustomCheckBox> {
  /// Экземпляр бизнес-логики
  RegPageWidgetModel get widgetModel => context.read<RegPageWidgetModel>();

  /// Локальное состояние виджета
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      StreamBuilder<bool>(
          stream: widgetModel.loadingStatusStream,
          builder: (_, __) {
            final loading = widgetModel.isLoading;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: loading ? null : () => _changeState(!_isChecked),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Checkbox(
                    fillColor: loading
                        ? MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return AppColors.red.withOpacity(0.24);
                              }
                              return AppColors.white;
                            },
                          )
                        : null,
                    value: _isChecked,
                    onChanged: loading
                        ? null
                        : (value) => _changeState(value ?? false),
                  ),
                  Flexible(
                    child: Text(widget.title,
                        style: CustomTextTheme.smallTextStyle),
                  ),
                ],
              ),
            );
          }),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _isChecked
            ? CustomTextField(
                controller: widget.controller,
                inputType: DateType(),
                formKey: widgetModel.formKey,
                label: AppStrings.lastVaccination,
              )
            : const SizedBox.shrink(),
      ),
    ]);
  }

  /// Изменить состояние виджета
  _changeState(bool val) {
    setState(() {
      _isChecked = val;
    });
  }
}
