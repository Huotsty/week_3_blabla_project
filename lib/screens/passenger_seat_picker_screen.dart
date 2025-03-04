import 'package:flutter/material.dart';

class PassengerSelectionScreen extends StatefulWidget {
  final int currentSeats;

  const PassengerSelectionScreen({super.key, required this.currentSeats});

  @override
  State<PassengerSelectionScreen> createState() => _PassengerSelectionScreenState();
}

class _PassengerSelectionScreenState extends State<PassengerSelectionScreen> {
  late int selectedSeats;

  @override
  void initState() {
    super.initState();
    selectedSeats = widget.currentSeats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Passengers")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Number of Passengers", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            DropdownButton<int>(
              value: selectedSeats,
              items: List.generate(8, (index) => index + 1)
                  .map((e) => DropdownMenuItem(value: e, child: Text("$e Seats")))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedSeats = value;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, selectedSeats);
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }
}
