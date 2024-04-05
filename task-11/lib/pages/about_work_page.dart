import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/resources/resources.dart';
import 'package:surf_flutter_courses_template/widgets/image_widget.dart';
import 'package:surf_flutter_courses_template/widgets/page_widget.dart';

import '../styles/styles.dart';

class AboutMyWorkPage extends StatelessWidget {
  const AboutMyWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'My work',
          style: textStyleBig,
        ),
      ),
      backgroundColor: backgroundColor,
      body: PageWidget(
        children: [
          const Text(
            'nine years of building the largest icebreakers in the world',
            style: textStyle,
          ),
          ImageWidget(image: MyImages.ship1),
          ImageWidget(image: MyImages.ship2),
          ImageWidget(image: MyImages.ship3),
          ImageWidget(image: MyImages.ship4),
        ],
      ),
    );
  }
}
