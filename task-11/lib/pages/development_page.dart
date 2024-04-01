import 'package:flutter/material.dart';

import 'main_page.dart';

class DevelopmentPage extends StatelessWidget {
  const DevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Development',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 50,
              fontFamily: 'Moskitoes'),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 133, 157, 168),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WhiteSpacer(),
              Text(
                'experience in development',
                style: textStyle,
              ),
              WhiteSpacer(),
              Text(
                'Simple tower defence game on C++',
                style: textStyle,
              ),
              Text(
                'Creating mods for games',
                style: textStyle,
              ),
              WhiteSpacer(),
              ToBeContWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
