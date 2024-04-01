import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/pages/main_page.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'About Me',
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
        child: Column(
          children: [
            WhiteSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NameWidget(),
                AgeWidget(),
              ],
            ),
            WhiteSpacer(),
            ToBeContWidget(),
          ],
        ),
      ),
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shevelkov',
          style: textStyle,
        ),
        Text('Evgenii', style: textStyle),
        Text('Vladimirovich', style: textStyle),
      ],
    );
  }
}

class AgeWidget extends StatelessWidget {
  const AgeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '27',
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Text('years', style: textStyle),
      ],
    );
  }
}
