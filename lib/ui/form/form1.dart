// form1_page.dart
import 'package:flutter/material.dart';

class Form1Page extends StatefulWidget {
  const Form1Page({super.key});

  @override
  State<Form1Page> createState() => _Form1PageState();
}

class _Form1PageState extends State<Form1Page> {
  final TextEditingController _controller1 = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  String? valueString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Form 1')),
        body: Row(
          children: [
            IconButton(
                constraints: const BoxConstraints(),
                style: IconButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.amber),
                onPressed: () {},
                icon: const Icon(Icons.person)),
            IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                icon: const Icon(Icons.person)),
          ],
        ));
  }
}
