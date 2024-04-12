import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureMaster(),
      ),
    );
  }
}

class GestureMaster extends StatefulWidget {
  const GestureMaster({super.key});

  @override
  State<GestureMaster> createState() => _GestureMasterState();
}

///
/// [TickerProviderStateMixin] needs for animation
///
class _GestureMasterState extends State<GestureMaster>
    with TickerProviderStateMixin {
  ///
  /// movable widget [Stack] + [Positioned]
  ///
  double _xPosition = 0;
  double _yPosition = 0;

  void moveWidget(details) {
    setState(() {
      _xPosition += details.delta.dx;
      _yPosition += details.delta.dy;
      print(
          'Move widget x: ${_xPosition.toStringAsFixed(2)} y: ${_yPosition.toStringAsFixed(2)}');
    });
  }

// change size widget
  var tapped = false;

  void changeSize() {
    tapped = !tapped;
    setState(() {
      print('Change size $tapped');
    });
  }

// change widget color

  var index = 0;
  var random = Random();

  final colors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.brown,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.black,
    Colors.cyan,
    Colors.indigo,
    Colors.lime,
    Colors.orange,
    Colors.teal,
  ];

  void changeColor() {
    index = random.nextInt(13);
    setState(() {
      print('Color index $index');
    });
  }

// animation
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
    print('Animation is ${_controller.isAnimating}');
  }

  @override
  Widget build(BuildContext context) {
    const double smallWidget = 100;
    const double bigWidget = 200;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          left: _xPosition,
          top: _yPosition,
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onPanUpdate: moveWidget,
              onTap: changeSize,
              onDoubleTap: changeColor,
              onLongPress: toggleAnimation,
              child: RotationTransition(
                turns: _animation,
                child: AnimatedContainer(
                  width: tapped ? bigWidget : smallWidget,
                  height: tapped ? bigWidget : smallWidget,
                  color: colors[index],
                  duration: const Duration(seconds: 2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
