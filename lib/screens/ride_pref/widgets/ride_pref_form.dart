import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/inputs/input_tile.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';
import 'package:week_3_blabla_project/widgets/displays/bla_divider.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/animations_util.dart';
import '../../location_picker_screen.dart';
import '../../passenger_seat_picker_screen.dart';
import '../../ride_result_screen.dart';


enum FormType { editing, searching }

class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  @override
  void initState() {
    super.initState();
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }

  void onDeparturePressed() async {
    Location? selectedLocation = await Navigator.of(context).push<Location>(
      AnimationUtils.createBottomToTopRoute(LocationPickerScreen(initLocation: departure)),
    );

    if (selectedLocation != null) {
      setState(() {
        departure = selectedLocation;
      });
    }
  }

  void onArrivalPressed() async {
    Location? selectedLocation = await Navigator.of(context).push<Location>(
      AnimationUtils.createBottomToTopRoute(LocationPickerScreen(initLocation: arrival)),
    );

    if (selectedLocation != null) {
      setState(() {
        arrival = selectedLocation;
      });
    }
  }

  void onPassengerPressed() async {
    int? selectedSeats = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (context) => PassengerSelectionScreen(currentSeats: requestedSeats),
      ),
    );

    if (selectedSeats != null) {
      setState(() {
        requestedSeats = selectedSeats;
      });
    }
  }
  void onSwappingLocationPressed() {
    setState(() {
      // We switch only if both departure and arrivate are defined
      if (departure != null && arrival != null) {
        Location temp = departure!;
        departure = Location.copy(arrival!);
        arrival = Location.copy(temp);
      }
    });
  }
  bool get switchVisible => arrival!=null && departure != null;

  void onSubmit(){
    if (departure != null && arrival != null) {
      // 1- Crea a Ride Pref from user inputs
      RidePref newRideRef = RidePref(
          departure: departure!,
          arrival: arrival!,
          departureDate: departureDate,
          requestedSeats: requestedSeats);
      Navigator.of(context)
          .push(AnimationUtils.createBottomToTopRoute(RideResultsScreen(
        initialRidePref: newRideRef,
      )));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InputTile(
          title: departure?.name ?? "Select departure",
          onPressed: onDeparturePressed,
          icon: Icons.circle_outlined,
          rightIcon: switchVisible? Icons.swap_vert:null,
          onRightIconPressed: switchVisible? onSwappingLocationPressed: null,
          // backgroundColor: departure != null ? Colors.blue[100] : null,
        ),
        const BlaDivider(),
        InputTile(
          title: arrival?.name ?? "Select arrival",
          onPressed: onArrivalPressed,
          icon: Icons.circle_outlined,
          // backgroundColor: arrival != null ? Colors.blue[100] : null,
        ),
        const BlaDivider(),
        InputTile(
          title: "${departureDate.toLocal()}".split(' ')[0],
          onPressed: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: departureDate,
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              setState(() {
                departureDate = picked;
              });
            }
          },
          icon: Icons.calendar_month,
        ),
        const BlaDivider(),
        InputTile(
          title: "$requestedSeats ",
          onPressed: onPassengerPressed,
          icon: Icons.person,
        ),
        const BlaDivider(),
        BlaButton(
          label: "Search",
          onPressed: onSubmit
        )
      ],
    );
  }
}
