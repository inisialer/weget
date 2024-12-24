// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weget/ui/instagram/components/app_bar_instagram.dart';
import 'package:weget/ui/instagram/components/card_story.dart';

final List<String> imgList = [
  'https://awsimages.detik.net.id/community/media/visual/2022/05/21/baymax_43.jpeg?w=1200',
  'https://awsimages.detik.net.id/community/media/visual/2022/05/21/baymax_43.jpeg?w=1200',
  'https://awsimages.detik.net.id/community/media/visual/2022/05/21/baymax_43.jpeg?w=1200',
];

class HomeInstagramScreen extends StatefulWidget {
  const HomeInstagramScreen({Key? key}) : super(key: key);

  @override
  State<HomeInstagramScreen> createState() => _HomeInstagramScreenState();
}

class _HomeInstagramScreenState extends State<HomeInstagramScreen> {
  String lorem =
      'lorem lorem lreom  lorem lreomlorem lorem lreomlorem lorem lreomlorem lorem lreomlorem lorem lreomlorem lorem lreomlorem lorem lreomlorem lorem lreomlorem lorem lreomlorem lorem lreomlorem lorem lreom';
  bool isMore = false;
  final CarouselController _controller = CarouselController();
  int _current = 0;
  String status = 'bertahan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: AppInstagram(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CardStory(),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  margin: const EdgeInsets.only(left: 12),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://i.pinimg.com/550x/65/b9/3d/65b93d87f0b269a94d024235254cfe8e.jpg',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                if (isMore)
                                  Text(
                                    'zapram12',
                                    style:
                                        GoogleFonts.roboto(color: Colors.white),
                                  )
                              ],
                            ),
                            const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.white)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.favorite_outline,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      dialogKomentar(context);
                                    },
                                    child: const Icon(
                                      Icons.comment_outlined,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  const Icon(
                                    Icons.share,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.save,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const CardLikes(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: 'zapram12',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  ' ${isMore ? lorem : "${lorem.substring(0, 100)}..."}',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                              ),
                            ),
                            isMore
                                ? const TextSpan()
                                : TextSpan(
                                    text: ' more',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => setState(() {
                                            isMore = !isMore;
                                          }),
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey,
                                    ),
                                  ),
                          ]),
                          maxLines: isMore ? 999 : 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  dialogKomentar(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Text(
                (() {
                  switch (status) {
                    case 'bertahan':
                      return ' Yakin masih kuat?';
                    case 'lepaskan':
                      return 'Tapi masih mau sama dia :(';
                  }

                  return "";
                })(),
                style: GoogleFonts.roboto(color: Colors.white),
              ),
              const Divider(),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 24,
                  ),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://scontent.cdninstagram.com/v/t51.2885-19/202780700_131673889037109_4286359305088308284_n.jpg?stp=dst-jpg_e0_s150x150&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=pY8-AUhhm7cAX-DfzVp&edm=APs17CUBAAAA&ccb=7-5&oh=00_AfDUgHmjow1Jkr2GvjHrAQwkxPgNL8AtRRWW4G9hUIY7EA&oe=65E75C94&_nc_sid=10d13b'),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: 'zapram12 ',
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: 'FUNGGGGG LU NGUNYAH AJA LUCUUUUU',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                    ))
                              ])),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.grey,
                          size: 14,
                        )
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://scontent.cdninstagram.com/v/t51.2885-19/202780700_131673889037109_4286359305088308284_n.jpg?stp=dst-jpg_e0_s150x150&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=pY8-AUhhm7cAX-DfzVp&edm=APs17CUBAAAA&ccb=7-5&oh=00_AfDUgHmjow1Jkr2GvjHrAQwkxPgNL8AtRRWW4G9hUIY7EA&oe=65E75C94&_nc_sid=10d13b'),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 16),
                        hintText: 'Add comment....',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  )),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
}

class CardLikes extends StatelessWidget {
  const CardLikes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Text(
        '4,211 Likes',
        style: GoogleFonts.roboto(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
