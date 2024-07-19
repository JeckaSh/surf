import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/core/domain/input_type_model/input_type_model.dart';
import 'package:surf_flutter_courses_template/presentation/theme/text_style_extension.dart';
import 'package:surf_flutter_courses_template/presentation/pages/reg_page/reg_page_widget_model.dart';

/// Виджет базового поля ввода данных
class CustomTextField extends StatefulWidget {
  /// Ключ формы к которой относится поле
  final GlobalKey<FormState> formKey;

  /// Контроллер поля ввода
  final TextEditingController controller;

  /// Заголовок поля
  final String label;

  /// Тип поля ввода
  final InputTypeModel inputType;

  /// Базовое поле ввода данных
  const CustomTextField(
      {super.key,
      required this.formKey,
      required this.label,
      required this.inputType,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

/// Состояние базового поля ввода данных
class _CustomTextFieldState extends State<CustomTextField> {
  /// Экземпляр бизнес-логики
  RegPageWidgetModel get widgetModel => context.read<RegPageWidgetModel>();

  /// Признак того, что значение в поле не соответствует условиям валидации
  bool isError = false;

  /// Локальный экземпляр контроллера поля ввода
  late TextEditingController _controller;

  /// Ключ поля в форме
  final _formFieldKey = GlobalKey<FormFieldState>();

  /// Локальный тип поля ввода
  late InputTypeModel _type;

  ///Узел фокусировки в приложении
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _type = widget.inputType;
    _focusNode.addListener(unfocusHandler);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).textTheme;
    final validator = _type.validator;
    final errorContentStyle = CustomTextTheme.mainTextStyle.copyWith(
      color: AppColors.red,
    );
    final onTap = _type.onTapFunc;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        children: [
          StreamBuilder<bool>(
              stream: widgetModel.loadingStatusStream,
              builder: (_, __) {
                return TextFormField(
                  focusNode: _focusNode,
                  enabled: !widgetModel.isLoading,
                  key: _formFieldKey,
                  controller: _controller,
                  inputFormatters: _type.formatters,
                  keyboardType: _type.keyboardType,
                  style: isError
                      ? errorContentStyle
                      : CustomTextTheme.mainTextStyle,
                  decoration: const InputDecoration().copyWith(
                    hintText: widget.label,
                    labelText: widget.label,
                    labelStyle:
                        isError ? CustomTextTheme.smallErrorTextStyle : null,
                  ),
                  validator: (value) {
                    final result = validator(value);
                    // Если валидация прошла успешно
                    if (result == null) {
                      setState(() {
                        isError = false;
                      });
                      return null;
                    }
                    // Если валидация прошла c ошибкой
                    setState(() {
                      isError = true;
                    });
                    return '';
                  },
                  onTap: onTap != null
                      ? () async {
                          await onTap(context, _controller);
                          _validate();
                        }
                      : null,
                  onChanged: (_) => _validate(),
                  onFieldSubmitted: (value) {
                    _controller.text = value.trim();
                  },
                );
              }),
          isError
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.inputType.errorMsg,
                      style: CustomTextTheme.smallErrorTextStyle),
                )
              : Container()
        ],
      ),
    );
  }

  /// Проверить значение в поле на соответствие условиям валидации для данного типа поля
  void _validate() {
    _formFieldKey.currentState!.validate();
  }

  /// Обработчик снятия фокуса с текстового поля
  Future<void> unfocusHandler() async {
    if (!_focusNode.hasFocus) {
      // При отключенной кнопке, начинаем проверять форму целиком
      if (widgetModel.isDeactivated) {
        widgetModel.checkValidForm();
      }
    }
  }
}
