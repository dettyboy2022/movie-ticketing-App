import 'package:flutter/material.dart';
import 'package:movie_ticketing/widget/bottmnav.dart';
import 'package:movie_ticketing/widget/custombutton.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Ticket extends StatefulWidget {
  final String selectedTime;
  final String selectedCinema;
  final String selectedSeat;
  final String selectedTitle;
  final String selectedImageUrl;
  final String selectedDate;

  const Ticket({
    Key? key,
    required this.selectedTime,
    required this.selectedCinema,
    required this.selectedSeat,
    required this.selectedTitle,
    required this.selectedImageUrl,
    required this.selectedDate,
  }) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  bool _isLoading = false;
  bool _showConfirmation = false;

  Widget _buildLoadingScreen() {
    return Container(
      color: Colors.black.withOpacity(0.8),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  void _showLoadingScreen() {
    setState(() {
      _isLoading = true;
    });
  }

  void _showConfirmationScreen() {
    setState(() {
      _isLoading = false;
      _showConfirmation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: _isLoading
          ? _buildLoadingScreen()
          : _showConfirmation
              ? _buildConfirmationScreen()
              : Center(
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
                                widget.selectedImageUrl,
                                width: double.infinity,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Date: ${widget.selectedDate}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              widget.selectedTitle,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Showtime: ${widget.selectedTime}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Cinema Experience: ${widget.selectedCinema}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Seat: ${widget.selectedSeat}',
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
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: 'Save',
                        onPressed: () {
                          _showLoadingScreen();
                          Future.delayed(const Duration(seconds: 2), () {
                            _showConfirmationScreen();
                          });
                        },
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _buildConfirmationScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 80,
          ),
          const SizedBox(height: 20),
          const Text(
            'Done!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Back to Home',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavBar()),
              );
            },
          ),
        ],
      ),
    );
  }
}
