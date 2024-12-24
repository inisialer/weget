// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeNetflixScreen extends StatefulWidget {
  const HomeNetflixScreen({Key? key}) : super(key: key);

  @override
  State<HomeNetflixScreen> createState() => _HomeNetflixScreenState();
}

class _HomeNetflixScreenState extends State<HomeNetflixScreen> {
  bool isExpansion = false;
  encryptData() {
    const plainText =
        'zCHZg3Q8WSDW59IOrJYnyvzgIEqdTiboK0xNkya5/gN+fyX61QwhopM/AAj/h52QlClmLkFIq2Yw7xiRVH/Otx+iz7FwphrgWx6/CePLARo1iNFWdPhoId8oH0131/wDzHJf/bpV1IXUUp9fqj6QBZSNawmGIgL7MlwmrR/bAJhtpW0Mja9WSD1uC/QKk/+BhyxVyyCW5WVnMj/blXN2ZfXmJkZtFZom4YxXmmQXcLmOOn+LN0bZiaSOzoDGcx4mXhqsewhk/oeQVQiNpZWMSySms42uEg/QFHGQIvVylzg=';
    final key = encrypt.Key.fromUtf8('your_secret_keyugyufukgjo');
    final iv = encrypt.IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
  }

  @override
  void initState() {
    encryptData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollTransformView(children: [
      ScrollTransformItem(
        builder: (scrollOffset) {
          return const Section1Netflix();
        },
      ),
      ScrollTransformItem(
        builder: (scrollOffset) {
          return const Section2Netflix();
        },
      ),
      ScrollTransformItem(
        builder: (scrollOffset) {
          return const Section2Netflix(
            color: Colors.pink,
            title: 'Download acara TV untuk menontonnya secara offline',
            desc:
                'Simpan favoritmu dengan mudah agar selalu ada acara TV dan film yang bisa ditonton.',
          );
        },
      ),
      ScrollTransformItem(
        builder: (scrollOffset) {
          return const Section2Netflix(
            color: Colors.black,
            title: 'Tonton di mana pun',
            desc:
                'Streaming film dan acara TV tak terbatas di ponsel, tablet, laptop, dan TV-mu.',
          );
        },
      ),
      ScrollTransformItem(
        builder: (scrollOffset) {
          return const Section2Netflix(
            color: Colors.pink,
            title: 'Buat profil untuk anak',
            desc:
                'Kirim anak-anak untuk bertualang bersama karakter favorit mereka di dunia yang dibuat khusus untuk mereka—gratis dengan keanggotaanmu.',
          );
        },
      ),
      ScrollTransformItem(
        builder: (scrollOffset) {
          return Container(
            color: Colors.black,
            width: double.infinity,
            child: Column(
              children: [
                cardExpansion(),
                cardExpansion(),
                cardExpansion(),
                cardExpansion(),
                cardExpansion()
              ],
            ),
          );
        },
      ),
    ]));
  }

  Padding cardExpansion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        backgroundColor: Colors.grey,
        collapsedBackgroundColor: Colors.grey,
        trailing: isExpansion ? const Icon(Icons.close) : const Icon(Icons.add),
        iconColor: Colors.white,
        onExpansionChanged: (value) {
          setState(() {
            isExpansion = value;
          });
        },
        collapsedIconColor: Colors.white,
        title: Text(
          'Apa itu netflix?',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Netflix adalah layanan streaming yang menawarkan berbagai acara TV pemenang penghargaan, film, anime, dokumenter, dan banyak lagi di ribuan perangkat yang terhubung ke Internet.',
              style: GoogleFonts.roboto(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class Section1Netflix extends StatelessWidget {
  const Section1Netflix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: const AssetImage('assets/netflix.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.colorBurn),
          )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NETFLIX',
                    style: GoogleFonts.urbanist(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white)),
                        child: Text(
                          'A',
                          style: GoogleFonts.urbanist(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const ButtonCard()
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(
                'Film, acara TV tak terbatas, dan banyak lagi',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Tonton di mana pun. Batalkan kapan pun.',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                'Siap menonton? Masukkan email untuk membuat atau memulai lagi keanggotaanmu.',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: 300.w,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Alamat email',
                      hintStyle: GoogleFonts.urbanist(color: Colors.white),
                      fillColor: Colors.black.withOpacity(0.5),
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white))),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 48,
                width: 109.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.red),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Mulai',
                          style: GoogleFonts.urbanist(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        Container(
          height: 8,
          color: Colors.black.withOpacity(0.8),
        )
      ],
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: Colors.red),
          onPressed: () {},
          child: Text(
            'Masuk',
            style: GoogleFonts.urbanist(color: Colors.white),
          )),
    );
  }
}

class Section2Netflix extends StatelessWidget {
  final String? title;
  final String? desc;
  final Color? color;
  const Section2Netflix({super.key, this.title, this.desc, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: color ?? Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              Text(
                title ?? 'Nikmati di TV-mu',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                desc ??
                    'Tonton di Smart TV, Playstation, Xbox, Chromecast, Apple TV, pemutar Blu-ray, dan banyak lagi.',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 32.0,
              ),
            ],
          ),
        ),
        Container(
          height: 8,
          color: Colors.black.withOpacity(0.8),
        )
      ],
    );
  }
}
