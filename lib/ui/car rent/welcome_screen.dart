// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weget/helper/router_name.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2B34),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 100),
              child: Image.asset(
                'assets/welcome.png',
                scale: 4,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Premium cars.\nEnjoy the luxury',
                  style: GoogleFonts.barlow(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  'Premium and prestige car daily rental.\nExperience the thrill at a lower price',
                  style: GoogleFonts.barlow(
                      color: const Color(0xFF8E8E8E),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 43.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed(homeCar);
                      },
                      child: Text(
                        "Let's Go",
                        style: GoogleFonts.barlow(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
