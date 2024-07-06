import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/core/domain/profile_widget/profile_widget_model.dart';
import 'package:surf_flutter_courses_template/core/domain/profile_widget/profile_widget_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ProfileWidgetModel>(
      create: (_) => ProfileWidgetModel()..init(),
      dispose: (_, widgetModel) => widgetModel.dispose(),
      child: const ProfileWidgetView(),
    );
  }
}
