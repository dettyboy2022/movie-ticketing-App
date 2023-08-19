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

  List<PageViewData> page = pagedata;

  final List<String> _pageImages = [
    'https://i.pinimg.com/originals/f3/62/07/f3620778355f6521b484fabd80f0e4c3.jpg',
    'https://th.bing.com/th/id/R.7d472b66940013e0d6cf8aeae4054f1d?rik=nNhL4V%2f31npOWg&pid=ImgRaw&r=0.jpg',
    'https://th.bing.com/th/id/R.9931932ced73e10b60c53c6cfd0368e2?rik=QZMroKStrDIB2A&pid=ImgRaw&r=0.jpg',
    'https://th.bing.com/th/id/R.55ed386aabf0e6f32e82e5718f68e94d?rik=vrLTGSaWr1%2fFoQ&pid=ImgRaw&r=0.jpg',
    'https://th.bing.com/th/id/R.e5a8653a925f5aef42c400ceb71db42d?rik=%2fOVr1QCLT7dmCg&pid=ImgRaw&r=0.jpg'
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        PageController(initialPage: _currentPage, viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(_pageImages[_currentPage]),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'Now Showing',
                        style: TextStyle(color: Colors.black),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'Coming Soon',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const Spacer(),
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Moviedetails(selected: selectedMovie);
                              },
                            ));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Moviedetails(
                            //               selected: selectedMovie,
                            //             )));
                          },
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.bounceInOut,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.9),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
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
                                          child: const Text('Sci-Fi')),
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: const Text('Action')),
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: const Text('Comedy'))
                                    ],
                                  )
                                ],
                              )),
                        );
                      })),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white)),
                child: const BottomAppBar(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Icon(Icons.movie, color: Colors.white),
                        Icon(Icons.person, color: Colors.white)
                      ]),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
