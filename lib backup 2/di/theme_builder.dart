import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/di/theme_inherited.dart';

// todo: описаниe typedef
// todo: описание билдера

typedef ThemeWidgetBuilder = Widget Function(
  BuildContext context,
  ThemeMode themeMode,
);

class ThemeBuilder extends StatefulWidget {
  final ThemeWidgetBuilder builder;

  const ThemeBuilder({
    super.key,
    required this.builder,
  });

  @override
  State<ThemeBuilder> createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  @override
  Widget build(BuildContext context) {
    // [ValueListenableBuilder] будет слушать и обновлять состояние [ThemeInherited]
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeInherited.of(context).themeMode,
      builder: (builderContext, themeMode, _) => widget.builder(
        builderContext,
        themeMode,
      ),
    );
  }
}
