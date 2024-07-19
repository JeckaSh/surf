import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/presentation/pages/reg_page/reg_page_widget_model.dart';
import 'package:surf_flutter_courses_template/presentation/theme/button_extension.dart';

/// Виджет кнопки отправки данных формы
class SendButton extends StatelessWidget {
  /// Параметр состояния загрузки данных
  final bool isLoading;

  /// Обработка нажатия кнопки
  final VoidCallback? callback;

  const SendButton({super.key, this.callback, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final widgetModel = context.read<RegPageWidgetModel>();

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: StreamBuilder<bool>(
                stream: widgetModel.loadingStatusStream,
                builder: (_, __) {
                  final isDeactivated = widgetModel.isDeactivated;

                  return ElevatedButton(
                    style:
                        Theme.of(context).elevatedButtonTheme.mainButton.style,
                    onPressed: isLoading || isDeactivated ? null : callback,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text(AppStrings.sendButton),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
