// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weget/bloc/movie/movie_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieBloc _movieBloc = MovieBloc();
  List filter = ['Home', 'Sports', 'Series', 'Movies', 'Tv Show'];
  List filter2 = [
    'Premier League',
    'AFF U23',
    'BRI Liga 1',
    'Premier',
    'Nonton Gratis',
    'Eksklusif',
    'Korea',
    'Indonesia',
    'Thailand'
  ];
  int indexSelected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movieBloc.add(GetMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(),
                    child: Row(
                      children: List.generate(
                        filter.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                indexSelected = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: indexSelected == index
                                    ? const Color(0xff323232)
                                    : const Color(0xffcccccc),
                              ),
                              child: Text(
                                filter[index],
                                style: TextStyle(
                                    color: indexSelected == index
                                        ? Colors.white
                                        : const Color(0xff666666),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  BlocBuilder<MovieBloc, MovieState>(
                      bloc: _movieBloc,
                      builder: (context, state) {
                        if (state is GetMovieLoading) {
                          return SizedBox(
                            width: double.infinity,
                            height: 200.0,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.white,
                              period: const Duration(milliseconds: 800),
                              child: Card(
                                child: Container(
                                  width: 300,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        } else if (state is GetMovieSuccess) {
                          return CarouselSlider(
                            options: CarouselOptions(viewportFraction: 0.9),
                            items: state.data.results!
                                .map((item) => Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://www.themoviedb.org/t/p/w260_and_h390_bestv2/${item.posterPath}'),
                                              fit: BoxFit.cover)),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                    ))
                                .toList(),
                          );
                        } else if (state is GetMovieError) {
                          return ElevatedButton(
                              onPressed: () {
                                _movieBloc.add(GetMovieEvent());
                              },
                              child: const Text('Coba Lagi'));
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            height: 200.0,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.white,
                              period: const Duration(milliseconds: 800),
                              child: Card(
                                child: Container(
                                  width: 300,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                  const SizedBox(
                    height: 24.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(),
                    child: Row(
                      children: List.generate(
                        filter2.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                indexSelected = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                filter2[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text(
                    'Bebas Pilih Paket Sesuai Kebutuhanmu',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  BlocBuilder<MovieBloc, MovieState>(
                      bloc: _movieBloc,
                      builder: (context, state) {
                        if (state is GetMovieLoading) {
                          return SizedBox(
                            width: double.infinity,
                            height: 200.0,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.white,
                              period: const Duration(milliseconds: 800),
                              child: Card(
                                child: Container(
                                  width: 300,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        } else if (state is GetMovieSuccess) {
                          return SizedBox(
                            height: 100,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.data.results?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 236,
                                    height: 104,
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://www.themoviedb.org/t/p/w260_and_h390_bestv2/${state.data.results?[index].backdropPath}'),
                                            alignment: Alignment.center,
                                            fit: BoxFit.cover)),
                                  );
                                }),
                          );
                        } else if (state is GetMovieError) {
                          return ElevatedButton(
                              onPressed: () {
                                _movieBloc.add(GetMovieEvent());
                              },
                              child: const Text('Coba Lagi'));
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            height: 200.0,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.white,
                              period: const Duration(milliseconds: 800),
                              child: Card(
                                child: Container(
                                  width: 300,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Vidio Originals',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  BlocBuilder<MovieBloc, MovieState>(
                      bloc: _movieBloc,
                      builder: (context, state) {
                        if (state is GetMovieLoading) {
                          return SizedBox(
                            width: double.infinity,
                            height: 200.0,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.white,
                              period: const Duration(milliseconds: 800),
                              child: Card(
                                child: Container(
                                  width: 300,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        } else if (state is GetMovieSuccess) {
                          return SizedBox(
                            height: 162,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.data.results?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 112,
                                    height: 162,
                                    alignment: Alignment.bottomLeft,
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://www.themoviedb.org/t/p/w260_and_h390_bestv2/${state.data.results?[index].backdropPath}'),
                                            fit: BoxFit.cover)),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.only(left: 8.0, bottom: 8),
                                      child: Icon(
                                        Icons.king_bed,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  );
                                }),
                          );
                        } else if (state is GetMovieError) {
                          return ElevatedButton(
                              onPressed: () {
                                _movieBloc.add(GetMovieEvent());
                              },
                              child: const Text('Coba Lagi'));
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            height: 200.0,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.white,
                              period: const Duration(milliseconds: 800),
                              child: Card(
                                child: Container(
                                  width: 300,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
