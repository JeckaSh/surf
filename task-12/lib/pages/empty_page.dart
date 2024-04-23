import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String title;
  const EmptyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 5,
          ),
          Text(title),
        ],
      ),
    );
  }
}
