import 'package:flutter/material.dart';
import 'package:movie_ticketing/model/cardmodel.dart';
import 'package:movie_ticketing/views/booking.dart';
import 'package:movie_ticketing/widget/custombutton.dart';

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
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 100),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            e['image'],
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
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
                        'James Cameron, Dwayne Johnson, Will Smith',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Writers : ',
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
                        'Amidst this surreal occurrence, Sarah, a gifted artist haunted by a tragic loss, discovers that she can control these echoes. As she delves into the echoes, she uncovers long-forgotten secrets and embarks on a journey to rewrite her own history.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 10,
            right: 30,
            left: 30,
            child: CustomButton(
              text: 'Book Now',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Bookings(selectedMovie: widget.selected)));
              },
            ),
           
          ),
        ],
      ),
    );
  }
}

List casts = [
  {
    'image':
        'https://th.bing.com/th/id/OIP.yEEAsSejuH2zIBdIatT07AHaKZ?w=197&h=278&c=7&r=0&o=5&dpr=1.1&pid=1.7.jpg',
    'text': 'James'
  },
  {
    'image':
        'https://th.bing.com/th/id/OIP.i4gS0Wk09F9ZxJT5eMWHJwHaJQ?w=197&h=246&c=7&r=0&o=5&dpr=1.1&pid=1.7.jpg',
    'text': 'Scott'
  },
  {
    'image':
        'https://th.bing.com/th/id/OIP.JQMUj_qHZ9ouUJqnc7cNmwAAAA?w=197&h=297&c=7&r=0&o=5&dpr=1.1&pid=1.7.jpg',
    'text': 'Daniel'
  },
  {
    'image':
        'https://th.bing.com/th/id/OIP.ZQykV7WBRCtstHhSprdN0wHaLH?w=197&h=296&c=7&r=0&o=5&dpr=1.1&pid=1.7.jpg',
    'text': 'Collins'
  }
];
