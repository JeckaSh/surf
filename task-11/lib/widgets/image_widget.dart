import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final Image image;

  const ImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: image,
    );
  }
}
