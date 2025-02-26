import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/inputs/input_tile.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';
import 'package:week_3_blabla_project/widgets/displays/bla_divider.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
///
enum FormType { editing, searching }

class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
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

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputTile(
              title: 'Going to', onPressed: () {}, icon: Icons.circle_outlined),
          const BlaDivider(),
          InputTile(
              title: 'Leaving from',
              onPressed: () {},
              icon: Icons.circle_outlined),
          const BlaDivider(),
          InputTile(
              title: 'Today', onPressed: () {}, icon: Icons.calendar_month),
          const BlaDivider(),
          InputTile(
            title: '1',
            onPressed: () {},
            icon: Icons.person,
          ),
          const BlaDivider(),
          BlaButton(
            label: 'Search',
            onPressed: () {},
          )
          // _buildSelectionTile(label: 'going to', icon: Icons.circle_outlined, onTap: () => print('Ronan the best'))
        ]);
  }
}
