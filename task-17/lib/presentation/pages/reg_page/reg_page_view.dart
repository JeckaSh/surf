import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/presentation/pages/reg_page/reg_page_widget_model.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/reg_form.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/send_button.dart';

/// Виджет обертка страницы формы регистрации животного
class RegPageView extends StatelessWidget {
  /// Обертка страницы формы регистрации животного
  const RegPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetModel = context.read<RegPageWidgetModel>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  child: RegForm(),
                ),
              ),
              StreamBuilder<bool>(
                  stream: widgetModel.loadingStatusStream,
                  builder: (_, __) {
                    return SendButton(
                        callback: widgetModel.sendData,
                        isLoading: widgetModel.isLoading);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
