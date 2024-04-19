import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String string;
  const EmptyPage({super.key, required this.string});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(string),
    );
  }
}
