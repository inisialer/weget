import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> statuses = [
    'Status 1',
    'Status 2',
    'Status 3',
    'Status 4'
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatusPage(statuses: statuses),
    );
  }
}

class StatusPage extends StatefulWidget {
  final List<String> statuses;

  const StatusPage({Key? key, required this.statuses}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  late PageController _pageController;
  late StreamController<int> _timerController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _timerController = StreamController<int>();
    startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timerController.close();
    super.dispose();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _timerController.add(_currentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Page'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.statuses.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return StatusItem(
            status: widget.statuses[index],
            isActive: _currentPage == index,
            timerStream: _timerController.stream,
          );
        },
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  final String status;
  final bool isActive;
  final Stream<int> timerStream;

  const StatusItem({
    Key? key,
    required this.status,
    required this.isActive,
    required this.timerStream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          status,
          style: const TextStyle(fontSize: 24.0),
        ),
        const SizedBox(height: 20.0),
        StreamBuilder<int>(
          stream: timerStream,
          builder: (context, snapshot) {
            return LinearTimer(
              color: isActive
                  ? Colors.white
                  : Colors.grey, // Warna berbeda untuk status yang aktif
              backgroundColor: Colors.white.withOpacity(0.2),
              duration: const Duration(seconds: 30),
            );
          },
        ),
      ],
    );
  }
}

class LinearTimer extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Duration duration;

  const LinearTimer({
    Key? key,
    required this.color,
    required this.backgroundColor,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
      backgroundColor: backgroundColor,
      value:
          1.0, // Waktu tidak akan berjalan mundur, jadi gunakan nilai tetap 1.0
    );
  }
}
