import 'dart:math';

import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:weget/constants.dart';

class HomeKhodamScreen extends StatefulWidget {
  const HomeKhodamScreen({Key? key}) : super(key: key);

  @override
  State<HomeKhodamScreen> createState() => _HomeKhodamScreenState();
}

class _HomeKhodamScreenState extends State<HomeKhodamScreen> {
  ValueNotifier<String> result = ValueNotifier('');
  ValueNotifier<List<dynamic>> results = ValueNotifier([]);
  Set<int> selectedIndexes = <int>{};
  final Random random = Random();
  final TextEditingController _controller = TextEditingController();

  int getRandomIndex(int length) {
    if (selectedIndexes.length >= length) {
      selectedIndexes.clear();
    }

    int index;
    do {
      index = random.nextInt(length);
    } while (selectedIndexes.contains(index));

    selectedIndexes.add(index);
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.colorBurn),
                      image: const AssetImage('assets/harimau.jpg'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Stack(
                  children: [
                    CircularParticle(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      particleColor: Colors.white.withOpacity(0.7),
                      numberOfParticles: 250,
                      speedOfParticles: 1.7,
                      maxParticleSize: 5,
                      isRandSize: true,
                      isRandomColor: true,
                      randColorList: [
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.8),
                        Colors.blueAccent.withOpacity(0.9),
                        Colors.purple.withOpacity(0.9),
                        Colors.amberAccent.withOpacity(1),
                        Colors.pinkAccent.withOpacity(1),
                      ],
                      awayRadius: 100,

                      awayAnimationDuration: const Duration(milliseconds: 600),
                      awayAnimationCurve: Curves.easeInOutBack,
                      enableHover: true,
                      hoverColor: Colors.white,
                      hoverRadius: 90,
                      onTapAnimation: false,
                      connectDots: false, // Not recommended
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Text(
                          'CEK KHODAM ANDA',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: _controller,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              hintText: 'Masukkan Nama Anda',
                              hintStyle: TextStyle(color: Colors.white)),
                          onFieldSubmitted: (value) {
                            var index = getRandomIndex(khodam.length);
                            result.value = khodam[index];
                            results.value.add({
                              "name": _controller.text,
                              "result": khodam[index]
                            });
                          },
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        ValueListenableBuilder(
                            valueListenable: result,
                            builder: (context, value, _) {
                              return Text(
                                'Khodam anda : ${result.value} ',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              );
                            }),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ValueListenableBuilder(
                            valueListenable: results,
                            builder: (context, value, _) {
                              return ListView.builder(
                                itemCount: results.value.length,
                                shrinkWrap: true,
                                reverse: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    child: ListTile(
                                      title: Text(results.value[index]['name']),
                                      subtitle:
                                          Text(results.value[index]['result']),
                                    ),
                                  );
                                },
                              );
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
