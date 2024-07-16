import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/presentation/pages/magic_ball_page/magic_ball_view.dart';
import 'package:surf_flutter_courses_template/presentation/pages/magic_ball_page/magic_ball_widget_model.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<MagicBallWidgetModel>(
      create: (_) => MagicBallWidgetModel()..init(),
      dispose: (_, widgetModel) => widgetModel.dispode(),
      child: const MagicBallView(),
    );
  }
}
