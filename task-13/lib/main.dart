import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:surf_flutter_courses_template/data/mapper/color_mapper.dart';
import 'package:surf_flutter_courses_template/data/repository/color_repository.dart';
import 'package:surf_flutter_courses_template/pages/main_page.dart';

import 'api/service/colors_api_assets.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then(
    (_) => runApp(
      const MainApp(),
    ),
  );
}

/// Инициализация локального репозитория
final colorsRepository = ColorsRepository(
  colorsApi: ColorApiAssets(),
  colorsMapper: ColorMapper(),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
