// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:weget/ui/export_excel/export_excel_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  ];
  List<Widget> content = [
    const ExportExcelScreen(),
    Container(
      child: const Text('Profile'),
    ),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
