import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/presentation/pages/reg_page/reg_page_view.dart';
import 'package:surf_flutter_courses_template/presentation/pages/reg_page/reg_page_widget_model.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<RegPageWidgetModel>(
      create: (_) => RegPageWidgetModel()..init(),
      dispose: (_, widgetModel) => widgetModel.dispose(),
      child: const RegPageView(),
    );
  }
}
