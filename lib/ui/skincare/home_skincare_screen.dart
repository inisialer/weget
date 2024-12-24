// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HomeSkincareScreen extends StatefulWidget {
  const HomeSkincareScreen({Key? key}) : super(key: key);

  @override
  State<HomeSkincareScreen> createState() => _HomeSkincareScreenState();
}

class _HomeSkincareScreenState extends State<HomeSkincareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .8,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 20,
                ),
                itemCount: 10,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 120,
                        margin: index % 2 == 0
                            ? const EdgeInsets.only(bottom: 20)
                            : const EdgeInsets.only(top: 20),
                        color: const Color(0xfff6f5e8),
                      ),
                      Positioned(
                        top: -20,
                        child: Padding(
                          padding: index % 2 == 0
                              ? const EdgeInsets.only(bottom: 20)
                              : const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/serum.png',
                                scale: 2.5,
                              ),
                              const Text('Serum anti acne')
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
