// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HomeMusic extends StatefulWidget {
  const HomeMusic({Key? key}) : super(key: key);

  @override
  State<HomeMusic> createState() => _HomeMusicState();
}

class _HomeMusicState extends State<HomeMusic> {
  List data = [
    {"title": "Seandainya warga +62", "duration": 3000},
    {"title": "Dilegalkan senjata", "duration": 1700},
    {"title": "kita langsung searah", "duration": 1700},
    {"title": "🔫", "duration": 500},
    {"title": "🔫", "duration": 500},
    {"title": "🔫", "duration": 500},
  ];
  List<Text> lirik = [];
  Future<void> addLirik() async {
    for (var i = 0; i < data.length; i++) {
      setState(() {
        if (i > 0) {
          lirik[i - 1] = Text(
            data[i - 1]["title"],
            style: TextStyle(color: Colors.white.withOpacity(.2)),
          );
          lirik.add(Text(
            data[i]["title"],
            style: const TextStyle(color: Colors.white),
          ));
        } else {
          lirik.add(Text(
            data[i]["title"],
            style: const TextStyle(color: Colors.white),
          ));
        }
      });
      await Future.delayed(Duration(milliseconds: data[i]["duration"]));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1));
    addLirik();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: List.generate(lirik.length, (index) {
                return lirik[index];
              }),
            ),
            const Text('feature b')
          ],
        ),
      ),
    );
  }
}
