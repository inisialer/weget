// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCarScreen extends StatefulWidget {
  const DetailsCarScreen({Key? key}) : super(key: key);

  @override
  State<DetailsCarScreen> createState() => _DetailsCarScreenState();
}

class _DetailsCarScreenState extends State<DetailsCarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              height: 376,
              decoration: const BoxDecoration(
                  color: Color(0xFF282931),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fortuner GR',
                    style: GoogleFonts.barlow(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.48,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Transform.rotate(
                                angle: 1,
                                child: const Icon(
                                  Icons.navigation_sharp,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '> 870km',
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 17.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.gas_meter,
                                color: Colors.white,
                              ),
                              Text(
                                '50L',
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 277,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 100),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Features',
                    style: GoogleFonts.barlow(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF292D32)),
                  ),
                  const SizedBox(
                    height: 14.0,
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
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.all(16),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE7E7E7)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.gas_meter),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                Text(
                                  'Diesel',
                                  style: GoogleFonts.barlow(
                                    color: const Color(0xFF292D32),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 105,
                                  child: Text(
                                    'Common Rail Fuel Injection',
                                    style: GoogleFonts.openSans(
                                      color: const Color(0xFF898A8D),
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '\$',
                            style: GoogleFonts.barlow(
                                fontSize: 34, fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: ' 45',
                            style: GoogleFonts.barlow(
                                fontSize: 34, fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: ',00',
                            style: GoogleFonts.barlow(
                                fontSize: 34, fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: '/day',
                            style: GoogleFonts.barlow(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                      ])),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.barlow(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 38.0, right: 38),
                  child: Image.asset(
                    'assets/detail.png',
                    scale: 4.5,
                  ),
                ),
              ],
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey.withOpacity(0.2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.menu_sharp)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
