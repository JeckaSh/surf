import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/extensions/text_extension.dart';

/// Виджет предсказания
class PredictionWidget extends StatelessWidget {
  final String message;

  final bool isErrorMessage;

  const PredictionWidget({
    super.key,
    required this.message,
    this.isErrorMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    final messageStyle = Theme.of(context).textTheme.messageTheme;
    final errorStyle = Theme.of(context).textTheme.errorMessage;

    return SizedBox(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                message,
                style: isErrorMessage ? errorStyle : messageStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
