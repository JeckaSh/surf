import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

/// Индикатор загрузки в виде трёх точек
class ProgressDotsIndicator extends StatefulWidget {
  const ProgressDotsIndicator({super.key});

  @override
  State<ProgressDotsIndicator> createState() => _ProgressDotsIndicatorState();
}

class _ProgressDotsIndicatorState extends State<ProgressDotsIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// Начальная точка индикатора
  var currentDots = 0.0;

  @override
  void initState() {
    super.initState();

    /// Инициализация контроллера анимации с одновременным запуском
    /// загрузки предсказания
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 3,
      duration: const Duration(milliseconds: 700),
    )..repeat();
    _controller.addListener(
      () {
        setState(() {
          currentDots = _controller.value;
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Цвет точки индикатора
    const colorDot = AppColors.appText;

    /// Форма точки
    final rectangleRadius =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0));
    return DotsIndicator(
      /// Прогресс выглядит как попеременно меняющиеся 3 точки
      dotsCount: 3,
      position: currentDots,
      decorator: DotsDecorator(
        color: colorDot,
        activeColor: colorDot,
        size: const Size.square(10),
        activeSize: const Size.square(16),
        shape: rectangleRadius,
        activeShape: rectangleRadius,
      ),
    );
  }
}
