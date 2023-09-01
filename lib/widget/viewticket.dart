import 'package:flutter/material.dart';

class ViewTicket extends StatelessWidget {
  const ViewTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Ticket'),
      ),
    );
  }
}


