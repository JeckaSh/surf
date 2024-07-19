import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:surf_flutter_courses_template/presentation/pages/homepage.dart';
import 'package:surf_flutter_courses_template/presentation/theme/theme_extension.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then(
    (_) => runApp(
      const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).mainTheme,
      home: const Scaffold(
        body: SafeArea(
          child: Homepage(),
        ),
      ),
    );
  }
}
