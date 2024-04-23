import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _counter = 0;
  int _incrementCount = 0;
  int _decrementCount = 0;

  void _reloadCounters() {
    _counter = 0;
    _incrementCount = 0;
    _decrementCount = 0;
    setState(() {});
  }

  void _incrementCounter() {
    _counter += 1;
    _incrementCount += 1;
    setState(() {});
  }

  void _decrementCounter() {
    if (_counter == 0) {
      _counter = 0;
      _decrementCount += 1;
    } else {
      _counter -= 1;
      _decrementCount += 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter: $_counter'),
              Text('Increment pressed: $_incrementCount'),
              Text('Decrement pressed: $_decrementCount'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    tooltip: 'Increment',
                    onPressed: _incrementCounter,
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    tooltip: 'Reload counters',
                    onPressed: _reloadCounters,
                    child: const Icon(Icons.refresh),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    tooltip: 'Decrement',
                    onPressed: _decrementCounter,
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
