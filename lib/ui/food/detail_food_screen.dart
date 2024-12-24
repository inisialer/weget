// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailFoodScreen extends StatefulWidget {
  const DetailFoodScreen({Key? key}) : super(key: key);

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  List menu = [
    {
      "scale": 6.0,
      "size": "Short",
      "ml": "236 ml",
    },
    {"scale": 4.5, "size": "Tall", "ml": "354 ml"},
    {"scale": 4.0, "size": "Grande", "ml": "473 ml"},
    {"scale": 1.0, "size": "Venti", "ml": "591 ml"},
  ];
  // int number = 0;
  ValueNotifier<int> number = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Details',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notification_add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 314,
                  height: 314,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF04653A),
                    shape: OvalBorder(),
                  ),
                  child: Image.asset(
                    'assets/cup.png',
                    scale: 4,
                  ),
                ),
              ),
              const SizedBox(
                height: 11.0,
              ),
              cardPrice(),
              const SizedBox(
                height: 16.0,
              ),
              cardSize(),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Add Extra',
                style: GoogleFonts.inter(
                  color: const Color(0xFF04653A),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              extraCard(),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: number,
                          builder: (context, value, _) {
                            return InkWell(
                              onTap: () {
                                number.value = number.value - 1;
                              },
                              child: Container(
                                width: 37,
                                height: 37,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF04653A),
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        width: 8.0,
                      ),
                      ValueListenableBuilder(
                          valueListenable: number,
                          builder: (context, value, _) {
                            return Text(
                              '${number.value}',
                              style: GoogleFonts.inter(
                                color: const Color(0xFF04653A),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }),
                      const SizedBox(
                        width: 8.0,
                      ),
                      ValueListenableBuilder(
                          valueListenable: number,
                          builder: (context, value, _) {
                            return InkWell(
                              onTap: () {
                                number.value = number.value + 1;
                              },
                              child: Container(
                                width: 37,
                                height: 37,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF04653A),
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                  const SizedBox(
                    width: 32.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF04653A)),
                        onPressed: () {},
                        child: const Text(
                          'Add to Order',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  GridView extraCard() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.0,
        crossAxisCount: 3,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemCount: 3,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF04653A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/coklat.png',
                scale: 3,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chocolate',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.add))
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  GridView cardSize() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
        crossAxisCount: 4,
        mainAxisSpacing: 6,
        crossAxisSpacing: 20,
      ),
      itemCount: menu.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 5, color: const Color(0xFF04653A))),
                child: Image.asset(
                  'assets/drink.png',
                  scale: menu[index]['scale'],
                )),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              menu[index]['size'],
              style: GoogleFonts.inter(
                color: const Color(0xFF04653A),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              menu[index]['ml'],
              style: GoogleFonts.inter(
                color: const Color(0xFF04653A),
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        );
      },
    );
  }

  Row cardPrice() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Americano',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'More Options',
              style: GoogleFonts.inter(
                color: const Color(0xFF04653A),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$15.00',
              style: GoogleFonts.inter(
                color: const Color(0xFF04653A),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Price',
              style: GoogleFonts.inter(
                color: const Color(0xFF04653A),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ],
    );
  }
}
