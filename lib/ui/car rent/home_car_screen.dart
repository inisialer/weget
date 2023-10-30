// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCarScreen extends StatefulWidget {
  const HomeCarScreen({Key? key}) : super(key: key);

  @override
  State<HomeCarScreen> createState() => _HomeCarScreenState();
}

class _HomeCarScreenState extends State<HomeCarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconText(),
                    IconText(
                      icons: Icons.notifications_outlined,
                      title: 'Notifications',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 23.0,
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NEAREST CAR',
                          style: GoogleFonts.barlow(
                              color: const Color(0xFF787878),
                              letterSpacing: 1.80,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 9.0,
                        ),
                        Image.asset('assets/home.png'),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          'Fortuner GR',
                          style: GoogleFonts.barlow(
                            color: const Color(0xFF2C2B34),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.40,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
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
                                        color: Color(0xFF787878),
                                      ),
                                    ),
                                    Text(
                                      '> 870km',
                                      style: GoogleFonts.barlow(
                                        color: const Color(0xFF787878),
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
                                      color: Color(0xFF787878),
                                    ),
                                    Text(
                                      '50L',
                                      style: GoogleFonts.barlow(
                                        color: const Color(0xFF787878),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '\$ 45,00/h',
                              style: GoogleFonts.barlow(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.70,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                const SizedBox(
                  height: 22.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 170,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF3F3F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                                height: 73, width: 73, child: CircleAvatar()),
                            const SizedBox(
                              height: 14.0,
                            ),
                            Text(
                              'Jane Cooper',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.barlow(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '\$ 4,253',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.barlow(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 17.0,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 170,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF3F3F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({super.key, this.title, this.icons});
  final String? title;
  final IconData? icons;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons ?? Icons.info_outline,
          size: 24.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          title ?? 'Information',
          style: GoogleFonts.barlow(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
