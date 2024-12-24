// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weget/ui/food/detail_food_screen.dart';

class HomeFoodScreen extends StatefulWidget {
  const HomeFoodScreen({Key? key}) : super(key: key);

  @override
  State<HomeFoodScreen> createState() => _HomeFoodScreenState();
}

class _HomeFoodScreenState extends State<HomeFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/drink.png',
              scale: 4.9,
              color: Colors.black,
            ),
            const SizedBox(
              width: 3.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Segelas",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Space",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.notification_add),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 38,
            ),
            height: 85,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Enjoy Your Day\n',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF40352E),
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'At ',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF40352E),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Segelas Space',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF40352E),
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg_food.png'), fit: BoxFit.fill)),
            child: Column(
              children: [
                const Row(
                  children: [
                    CardMenu(
                      margin: EdgeInsets.only(top: 50),
                    ),
                    CardMenu(
                      title: 'Drinks',
                      image: 'assets/drink.png',
                    ),
                    CardMenu(
                      title: 'Bakery',
                      image: 'assets/cake.png',
                    ),
                    CardMenu(
                      title: 'Meals',
                      image: 'assets/burger.png',
                      margin: EdgeInsets.only(top: 50),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Stack(
                        children: [
                          Positioned(
                            left: -30,
                            top: 40,
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(top: 45),
                              decoration: const ShapeDecoration(
                                color: Color(0xFF00522E),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/cup_right.png',
                            scale: 4.8,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailFoodScreen(),
                            ));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 202,
                            height: 202,
                            margin: const EdgeInsets.only(top: 15),
                            decoration: const ShapeDecoration(
                              color: Color(0xFF00522E),
                              shape: OvalBorder(),
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/cup.png',
                                scale: 4,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                'Americano',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 0,
                            right: -40,
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(top: 45),
                              decoration: const ShapeDecoration(
                                color: Color(0xFF00522E),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/cup_left.png',
                            scale: 5.5,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CardMenu extends StatelessWidget {
  const CardMenu({
    super.key,
    this.title,
    this.image,
    this.margin,
  });
  final String? title;
  final String? image;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          width: 72,
          height: 72,
          margin: margin ?? const EdgeInsets.only(top: 0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            image ?? 'assets/coffee.png',
            scale: 4,
          ),
        ),
        Text(
          title ?? 'Hot Coffee',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ));
  }
}
