import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ticktet.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
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
                  children: time
                      .map((e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTime = e;
                              });
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Text(
                                e,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                      .toList(),
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
                  children: cinemaType
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCinema = e;
                                });
                              },
                              child: Text(
                                e,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: 25,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (context, index) {
                    return IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chair,
                          color: Colors.white,
                        ));
                  }),
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
                  // ElevatedButton(
                  //   onPressed: () {
                  //     if (selectedTime != null) {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) =>
                  //               Ticket(selectedTime: selectedTime),
                  //         ),
                  //       );
                  //     } else {
                  //       // Handle case where no time is selected
                  //     }
                  //   },
                  //   child: Text('Get Ticket'),
                  // ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          minimumSize: const Size(300, 50)),
                      onPressed: () {
                        if (selectedTime != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ticket(
                                selectedTime: selectedTime,
                                selectedCinema: selectedCinema,
                              ),
                            ),
                          );
                        } else {
                          // Handle case where no time is selected
                        }
                      },
                      child: const Text('Buy Tickets')),
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

  late String selectedTime;

  List cinemaType = [
    'Extreme 3D',
    'Ultra 4K',
    'BLU-RAY',
    'IMAX',
    'Extreme 3D',
    'Ultra 4K',
    'BLU-RAY',
    'IMAX',
  ];

  late String selectedCinema;
}
