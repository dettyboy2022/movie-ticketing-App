import 'package:flutter/material.dart';
import 'package:movie_ticketing/model/cardmodel.dart';
import 'package:movie_ticketing/views/booking.dart';

class Moviedetails extends StatefulWidget {
  final PageViewData selected;
  const Moviedetails({super.key, required this.selected});

  @override
  State<Moviedetails> createState() => _MoviedetailsState();
}

class _MoviedetailsState extends State<Moviedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Hero(
                      tag: 'animate-${widget.selected.url}',
                      child: Image.network(
                        widget.selected.url,
                        // width: double.infinity,
                        // height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          widget.selected.title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        subtitle: const Text(
                          'welcome',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '9.1',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: const Text(
                                'Animated',
                                style: TextStyle(color: Colors.white),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: const Text(
                                'Animated',
                                style: TextStyle(color: Colors.white),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: const Text(
                                'Animated',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'xscedcdvd',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'xscedcdvd',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'xscedcdvd',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Divider(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: casts
                                .map((e) => Container(
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      child: Column(
                                        children: [
                                          Image.network(
                                            e['image'],
                                            width: 50,
                                          ),
                                          Text(e['text'])
                                        ],
                                      ),
                                    ))
                                .toList()),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          // Positioned(
          //   top: 280,
          //   left: 15,
          //   right: 15,
          //   child: Container(
          //     padding: const EdgeInsets.all(15),
          //     width: 350,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Colors.black,
          //         border: Border.all(color: Colors.white)),
          //     child: Column(
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               widget.selected.title,
          //               style: const TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w600),
          //             ),
          //             const Icon(
          //               Icons.save,
          //               color: Colors.white,
          //             )
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         const Row(
          //           children: [
          //             Text(
          //               '2021',
          //               style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.w500),
          //             ),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Text('Adventure',
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.w500))
          //           ],
          //         ),
          //         ListTile(
          //           contentPadding: EdgeInsets.zero,
          //           leading: const Icon(
          //             Icons.person,
          //             color: Colors.white,
          //           ),
          //           title: Text(
          //             widget.selected.title,
          //             style: const TextStyle(
          //               color: Colors.white,
          //             ),
          //           ),
          //           subtitle: const Text(
          //             'Sony Games',
          //             style: TextStyle(
          //               color: Colors.white,
          //             ),
          //           ),
          //           trailing: Container(
          //             padding: const EdgeInsets.all(5),
          //             decoration: BoxDecoration(
          //                 border: Border.all(color: Colors.white)),
          //             child: const Row(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 Icon(
          //                   Icons.play_arrow,
          //                   color: Colors.white,
          //                 ),
          //                 Text(
          //                   'Watch Trailer',
          //                   style: TextStyle(color: Colors.white),
          //                 )
          //               ],
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          Positioned(
              bottom: 10,
              right: 30,
              left: 30,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 60)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Bookings()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.airplane_ticket),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Book Now'),
                    ],
                  )))
        ],
      ),
    );
  }
}

List casts = [
  {
    'image':
        'https://th.bing.com/th/id/R.7d472b66940013e0d6cf8aeae4054f1d?rik=nNhL4V%2f31npOWg&pid=ImgRaw&r=0.jpg',
    'text': 'ddddd'
  },
  {
    'image':
        'https://th.bing.com/th/id/R.7d472b66940013e0d6cf8aeae4054f1d?rik=nNhL4V%2f31npOWg&pid=ImgRaw&r=0.jpg',
    'text': 'ddddd'
  },
  {
    'image':
        'https://th.bing.com/th/id/R.7d472b66940013e0d6cf8aeae4054f1d?rik=nNhL4V%2f31npOWg&pid=ImgRaw&r=0.jpg',
    'text': 'ddddd'
  },
  {
    'image':
        'https://th.bing.com/th/id/R.7d472b66940013e0d6cf8aeae4054f1d?rik=nNhL4V%2f31npOWg&pid=ImgRaw&r=0.jpg',
    'text': 'ddddd'
  }
];
