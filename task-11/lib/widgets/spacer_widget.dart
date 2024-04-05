import 'package:flutter/material.dart';

class WhiteSpacer extends StatelessWidget {
  final double height;

  const WhiteSpacer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: height,
        width: 400,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    );
  }
}
