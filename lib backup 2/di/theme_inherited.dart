import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/theme_controller.dart';

// todo: Документация методов

class ThemeInherited extends InheritedWidget {
  final ThemeController themeController;

  const ThemeInherited({
    super.key,
    required this.themeController,
    required super.child,
  });

  static ThemeController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeInherited>()
        ?.themeController;
  }

  static ThemeController of(BuildContext context) {
    final ThemeController? result = maybeOf(context);
    assert(
      result != null,
      'Error! No ThemeInherited found in context!',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeInherited oldWidget) => false;
}
