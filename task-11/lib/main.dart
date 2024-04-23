import 'package:flutter/material.dart';

import 'pages/about_me_page.dart';
import 'pages/about_work_page.dart';
import 'pages/development_page.dart';
import 'pages/main_page.dart';
import 'pages/my_hobbies_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPageWidget(),
        '/aboutMe': (context) => const AboutMePage(),
        '/aboutWork': (context) => const AboutMyWorkPage(),
        '/hobbies': (context) => const AboutMyHobbiesPage(),
        '/development': (context) => const DevelopmentPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
