import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/di/injectable.dart';
import 'package:surf_flutter_courses_template/presentation/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  // waiting DI
  await initDependencyInjections();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
