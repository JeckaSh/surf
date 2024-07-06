import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/color_switcher.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/theme_switcher.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ThemeSwitcher(),
          ColorSwitcher(),
        ],
      ),
    );
  }
}
