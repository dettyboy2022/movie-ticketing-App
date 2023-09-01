import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_ticketing/views/moviedetails.dart';
import 'model/cardmodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        PageController(initialPage: _currentPage, viewportFraction: 0.9);
  }

  final double _movieCardPage = 0.0;
  final int _movieCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(pagedata[_currentPage].url),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'Now Showing',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          // color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'Coming Soon',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ],
              ),
              // const Spacer(),
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                  height: 500,
                  child: PageView.builder(
                      itemCount: pagedata.length,
                      controller: _controller,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        final selectedMovie = pagedata[index];
                        final progress = (_movieCardPage - index);
                        final scale = lerpDouble(1, 1, progress.abs());
                        final isScrolling =
                            _controller.position.isScrollingNotifier.value;
                        final isCurrentPage = index == _movieCardIndex;
                        final isFirstPage = index == 0;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Moviedetails(selected: selectedMovie);
                              },
                            ));
                          },
                          child: Transform.scale(
                            alignment: Alignment.lerp(Alignment.topLeft,
                                Alignment.topRight, -progress),
                            scale: scale,
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.bounceInOut,
                                transform: Matrix4.identity()
                                  ..translate(isCurrentPage ? 0.0 : -20.0,
                                      isCurrentPage ? 0.0 : 60.0),
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black87,
                                      spreadRadius: 5,
                                      blurRadius: 8,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Hero(
                                        tag: 'animate-${pagedata[index].url}',
                                        child: Image.network(
                                          pagedata[index].url,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 300,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Language: English'),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('8.0')
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      pagedata[index].title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Sci-Fi',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                        OutlinedButton(
                                            onPressed: () {},
                                            child: const Text('Action',
                                                style: TextStyle(
                                                    color: Colors.black))),
                                        OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Comedy',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ))
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        );
                      })),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
