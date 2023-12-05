// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class PalestineScreen extends StatefulWidget {
  const PalestineScreen({Key? key}) : super(key: key);

  @override
  State<PalestineScreen> createState() => _PalestineScreenState();
}

class _PalestineScreenState extends State<PalestineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Free Palestine"),
        actions: const [],
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(180),
                  bottomRight: Radius.circular(180)),
              border: Border.all(width: 10, color: Colors.green)),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                child: Row(
                  children: List.generate(
                    12,
                    (index) {
                      var item = {};
                      bool selected = index == 0;

                      return Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        color: Colors.black,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                child: Row(
                  children: List.generate(
                    10,
                    (index) {
                      var item = {};
                      bool selected = index == 0;

                      return Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        color: Colors.black,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                child: Row(
                  children: List.generate(
                    8,
                    (index) {
                      var item = {};
                      bool selected = index == 0;

                      return Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        color: Colors.black,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                child: Row(
                  children: List.generate(
                    6,
                    (index) {
                      var item = {};
                      bool selected = index == 0;

                      return Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        color: Colors.black,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
