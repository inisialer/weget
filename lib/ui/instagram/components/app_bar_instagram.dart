import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInstagram extends StatelessWidget {
  const AppInstagram({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      title: Text(
        "Instagram",
        style: GoogleFonts.sansita(color: Colors.white),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2, color: Colors.white)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        const Icon(
          Icons.favorite_border_outlined,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 16.0,
        ),
      ],
    );
  }
}
