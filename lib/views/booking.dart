import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/cardmodel.dart';
import '../widget/custombutton.dart';
import 'ticktet.dart';

class Bookings extends StatefulWidget {
  final PageViewData selectedMovie;
  const Bookings({super.key, required this.selectedMovie});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {

  List<String> selectedSeat = [];

  void _onSeatSelected(String seat) {
    setState(() {
      if (selectedSeat.contains(seat)) {
        selectedSeat.remove(seat);
      } else {
        selectedSeat.add(seat);
      }
    });
  }

  TextEditingController dateControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          'Choose Seats',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 15),
                    color: Colors.white,
                    child: const Text(
                      'Screen',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: 'Select Date',
                      border: OutlineInputBorder()),
                  controller: dateControl,
                  onTap: () async {
                    DateTime? datePicked = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2020),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2023));

                    if (datePicked != null) {
                      setState(() {
                        dateControl.text =
                            DateFormat.yMMMMd().format(datePicked);
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: time.map((e) {
                    final isSelected = selectedTime == e;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = e;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: isSelected ? Colors.blue : Colors.transparent,
                        ),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: cinemaType.map((e) {
                    final isSelected = selectedCinema == e;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCinema = e;
                          });
                        },
                        child: Text(
                          e,
                          style: TextStyle(
                            color: isSelected ? Colors.blue : Colors.white,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 25,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemBuilder: (context, index) {
                  final seat = 'Seat ${index + 1}';
                  final isSelected = selectedSeat.contains(seat);

                  return IconButton(
                    onPressed: () {
                      _onSeatSelected(seat);
                    },
                    icon: Icon(
                      Icons.chair,
                      color: isSelected ? Colors.green : Colors.white,
                    ),
                  );
                },
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Available',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Reserved',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Selected',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () {
                      if (selectedTime != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ticket(
                              selectedTime: selectedTime,
                              selectedCinema: selectedCinema,
                              selectedSeat: selectedSeat[0],
                              selectedTitle: widget.selectedMovie.title,
                              selectedImageUrl: widget.selectedMovie.url,
                              selectedDate: dateControl.text,
                            ),
                          ),
                        );
                      } else {
                        // Handle case where no time is selected
                      }
                    },
                    text: 'Buy TIckets',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List time = [
    '1:00 PM',
    '2:50 PM',
    '4:20 PM',
    '5:50 PM',
    '8:00 PM',
    '10:00 PM',
    '11:50 PM',
  ];

  String selectedTime = '';

  List cinemaType = [
    'Extreme 3D',
    'Ultra 4K',
    'BLU-RAY',
    'IMAX',
    'VR',
    'Regular',
    'Standard',
    'VVIP',
  ];

  String selectedCinema = '';
}
