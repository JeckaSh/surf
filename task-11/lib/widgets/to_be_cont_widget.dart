import 'package:flutter/material.dart';

import '../styles/styles.dart';

class ToBeContWidget extends StatelessWidget {
  const ToBeContWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'To be continued...',
          style: textStyle,
        ),
      ],
    );
  }
}
