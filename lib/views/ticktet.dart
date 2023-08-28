import 'package:flutter/material.dart';
import 'package:movie_ticketing/home.dart';
import 'package:movie_ticketing/widget/custombutton.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Ticket extends StatelessWidget {
  final String selectedTime;
  final String selectedCinema;
  final String selectedSeat;
  final String selectedTitle;
  final String selectedImageUrl;
  final String selectedDate;

  const Ticket({
    super.key,
    required this.selectedTime,
    required this.selectedCinema,
    required this.selectedSeat,
    required this.selectedTitle,
    required this.selectedImageUrl,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            TicketWidget(
              padding: const EdgeInsets.all(20),
              color: Colors.grey,
              width: 350,
              height: 550,
              isCornerRounded: true,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      selectedImageUrl,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Date: $selectedDate',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    selectedTitle,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Showtime: $selectedTime',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Cinema Experience: $selectedCinema',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Seat: $selectedSeat',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  Container(
                    width: 250,
                    height: 50,
                    color: Colors.black,
                    child: Image.network(
                      'https://th.bing.com/th/id/R.af65ea647f506dc673ff1ef625a08978?rik=0WiC84TalEN5oQ&pid=ImgRaw&r=0.jpg',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: 'Save',
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                })
          ],
        ),
      ),
    );
  }
}
