// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BasicUi extends StatefulWidget {
  const BasicUi({Key? key}) : super(key: key);

  @override
  State<BasicUi> createState() => _BasicUiState();
}

class _BasicUiState extends State<BasicUi> {
  //tipe data
  int angka = 0; //->double,num
  double angka2 = 0;
  num angka3 = 0;

  String kata = 'cewe ngoding';

  bool isTrue = false;

  List<Map<String, dynamic>> data = [
    {"a": 'a'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            children: [Text('')],
          ),
        ),
      ),
    );
  }
}
