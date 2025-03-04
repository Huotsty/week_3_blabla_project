import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

import '../model/ride/ride.dart';
import '../service/rides_service.dart';
import '../theme/theme.dart';
import '../widgets/ride_pref_bar.dart';
import '../widgets/rides_tile.dart';

class RideResultsScreen extends StatefulWidget {
  final RidePref initialRidePref;
  const RideResultsScreen({super.key, required  this.initialRidePref});


  @override
  State<RideResultsScreen> createState() => _RideResultsScreenState();
}

class _RideResultsScreenState extends State<RideResultsScreen> {
  List<Ride> get matchingRides =>
      RidesService.getRidesFor(widget.initialRidePref);

  void onRidePrefPressed() {

    // 1- open a modal to edit the ride preferences

  }



  void onFilterPressed() {
    print("onFilterPressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
          child: Column(
            children: [
              // Top search Search bar
              RidePrefBar(
                  ridePref: widget.initialRidePref,
                  onRidePrefPressed: onRidePrefPressed,
                  onFilterPressed: onFilterPressed),
              Expanded(
                child: ListView.builder(
                  itemCount: matchingRides.length,
                  itemBuilder: (ctx, index) => RideTile(
                    ride: matchingRides[index],
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
