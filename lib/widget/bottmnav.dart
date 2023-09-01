import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_ticketing/home.dart';
import 'package:movie_ticketing/widget/viewticket.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

int currentIndex = 0;

List<Widget> pages = [const Home(), const ViewTicket()];

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        pages[currentIndex],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Align(
            alignment: const Alignment(0.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                currentIndex: currentIndex,
                fixedColor: Colors.black,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.ticket), label: 'Ticket')
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
