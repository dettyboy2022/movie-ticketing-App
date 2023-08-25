import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  final String selectedTime;
  final String selectedCinema;
  const Ticket(
      {super.key, required this.selectedTime, required this.selectedCinema});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              'Showtime: $selectedTime',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Cinema Experience: $selectedCinema',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
