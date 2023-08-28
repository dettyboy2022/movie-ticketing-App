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
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            currentIndex: currentIndex,
            backgroundColor: Colors.transparent,
            fixedColor: Colors.red,
            items: const [
              BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.ticket), label: 'Ticket'),
            ]),
      ),
    );
  }
}
