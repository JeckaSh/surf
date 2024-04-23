import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/widgets/spacer_widget.dart';

class PageWidget extends StatelessWidget {
  final List<Widget> children;

  const PageWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (BuildContext context, int index) => children[index],
      separatorBuilder: (BuildContext context, int index) {
        return const WhiteSpacer(height: 5);
      },
      itemCount: children.length,
    );
  }
}
