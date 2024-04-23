import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/styles/styles.dart';
import 'package:surf_flutter_courses_template/widgets/page_widget.dart';
import 'package:surf_flutter_courses_template/widgets/to_be_cont_widget.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'About Me',
          style: textStyleBig,
        ),
      ),
      backgroundColor: backgroundColor,
      body: const PageWidget(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shevelkov\nEvgenii\nVladimirovich',
                style: textStyle,
              ),
              Column(
                children: [
                  Text(
                    '27',
                    style: numberBigStyle,
                  ),
                  Text(
                    'years',
                    style: textStyle,
                  ),
                ],
              ),
            ],
          ),
          ToBeContWidget(),
        ],
      ),
    );
  }
}
