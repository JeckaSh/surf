import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/widgets/page_widget.dart';
import 'package:surf_flutter_courses_template/widgets/to_be_cont_widget.dart';

import '../styles/styles.dart';

class DevelopmentPage extends StatelessWidget {
  const DevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'Development',
          style: textStyleBig,
        ),
      ),
      backgroundColor: backgroundColor,
      body: const PageWidget(
        children: [
          Text(
            'experience in development:',
            style: textStyle,
          ),
          Text(
            'Simple tower defence game on C++\nCreating mods for games',
            style: textStyle,
          ),
          ToBeContWidget(),
        ],
      ),
    );
  }
}
