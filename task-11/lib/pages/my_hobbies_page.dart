import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/resources/resources.dart';
import 'package:surf_flutter_courses_template/widgets/image_widget.dart';
import 'package:surf_flutter_courses_template/widgets/page_widget.dart';

import '../styles/styles.dart';

class AboutMyHobbiesPage extends StatelessWidget {
  const AboutMyHobbiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'My hobbies',
          style: textStyleBig,
        ),
      ),
      backgroundColor: backgroundColor,
      body: PageWidget(
        children: [
          const Text(
            'my hobbies are nintendo switch, board games with friends and beat saber with glasses oculus quest',
            style: textStyle,
          ),
          ImageWidget(image: MyImages.switchImage),
          ImageWidget(image: MyImages.boardGame),
          ImageWidget(image: MyImages.beatSaber),
        ],
      ),
    );
  }
}
