import 'package:flutter/material.dart';
import 'package:movie_ticketing/model/cardmodel.dart';
import 'package:movie_ticketing/views/booking.dart';

class Moviedetails extends StatefulWidget {
  final PageViewData selected;
  const Moviedetails({super.key, required this.selected});

  @override
  State<Moviedetails> createState() => _MoviedetailsState();
}

List<String> textList = ['Action', 'Adventure', 'Western'];

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
                backgroundColor: Colors.black,
                // floating: true,
                // snap: true,
                expandedHeight: 400,
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Hero(
                      tag: 'animate-${widget.selected.url}',
                      child: Image.network(
                        widget.selected.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
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
                        trailing: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Text(
                              '9.1',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(
                            textList.length,
                            (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: OutlinedButton(
                                      onPressed: () {},
                                      child: Text(
                                        textList[index],
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            textList.length,
                            (index) => const Column(
                                  children: [
                                    Text(
                                      'IMBD Rating',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '6/10',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: casts
                              .map((e) => Container(
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: Column(
                                      children: [
                                        Image.network(
                                          e['image'],
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          e['text'],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList()),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Description : ',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Text(
                        'In a futuristic world torn by conflict, a reluctant hero emerges to uncover a hidden truth that could change everything. As secrets unravel and alliances shift, the fate of humanity hangs in the balance',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Directors : ',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Text(
                        'In a futuristic world torn by conflict, a reluctant hero emerges to uncover a hidden truth that could change everything. As secrets unravel and alliances shift, the fate of humanity hangs in the balance',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Writer : ',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Text(
                        'In a futuristic world torn by conflict, a reluctant hero emerges to uncover a hidden truth that could change everything. As secrets unravel and alliances shift, the fate of humanity hangs in the balance',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Storyline : ',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Text(
                        'In a futuristic world torn by conflict, a reluctant hero emerges to uncover a hidden truth that could change everything. As secrets unravel and alliances shift, the fate of humanity hangs in the balance',
                        style: TextStyle(color: Colors.white),
                      ),
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
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
    'text': 'James'
  },
  {
    'image':
        'https://th.bing.com/th/id/R.7d472b66940013e0d6cf8aeae4054f1d?rik=nNhL4V%2f31npOWg&pid=ImgRaw&r=0.jpg',
    'text': 'Scott'
  },
  {
    'image':
        'https://th.bing.com/th/id/R.7d472b66940013e0d6cf8aeae4054f1d?rik=nNhL4V%2f31npOWg&pid=ImgRaw&r=0.jpg',
    'text': 'Daniel'
  },
  {
    'image':
        'https://th.bing.com/th/id/R.7d472b66940013e0d6cf8aeae4054f1d?rik=nNhL4V%2f31npOWg&pid=ImgRaw&r=0.jpg',
    'text': 'Collins'
  }
];
