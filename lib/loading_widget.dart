import 'dart:async';

import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  int _currentIndex = 0;
  final List<String> _imagePaths = [
    'assets/loading1.png',
    'assets/loading2.png',
    'assets/loading3.png',
    'assets/loading4.png',
  ];

  @override
  void initState() {
    super.initState();
    // Start animation
    startAnimation();
  }

  void startAnimation() {
    // Start changing images with an interval
    Duration interval = const Duration(milliseconds: 100);
    Timer.periodic(interval, (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imagePaths.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(_imagePaths[_currentIndex]),
          fit: BoxFit.contain,
        ),
      ),
      width: 100,
      height: 100,
    );
  }
}
