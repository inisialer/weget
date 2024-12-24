// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeSkeletonScreen extends StatefulWidget {
  const HomeSkeletonScreen({Key? key}) : super(key: key);

  @override
  State<HomeSkeletonScreen> createState() => _HomeSkeletonScreenState();
}

class _HomeSkeletonScreenState extends State<HomeSkeletonScreen> {
  bool isLoading = true;
  updateLoading() {
    Timer(const Duration(seconds: 5), () {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Skeletonizer(
                enabled: isLoading,
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const NetworkImage(
                            "https://i.ibb.co/QrTHd59/woman.jpg",
                          ),
                        ),
                        title: const Text("Jessica Doe"),
                        subtitle: const Text("Programmer"),
                        trailing: const Icon(Icons.edit),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
