import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:surf_flutter_courses_template/data/repository/photo_repository.dart';
import 'package:surf_flutter_courses_template/presentation/pages/photo_screen.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then(
    (_) => runApp(
      const MainApp(),
    ),
  );
}

final repository = PhotoRepository();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const PhotoScreen(),
    );
  }
}
