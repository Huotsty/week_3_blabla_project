import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/rides/widgets/ride_pref_bar.dart';

import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/ride_prefs_service.dart';
import '../../service/rides_service.dart';
import '../../theme/theme.dart';
import '../ride_pref/widgets/ride_pref_form.dart';
import 'widgets/rides_tile.dart';

///
///  The Ride Selection screen allow user to select a ride, once ride preferences have been defined.
///  The screen also allow user to re-define the ride preferences and to activate some filters.
///
class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  late RidePreference currentPreference;
  // // RidePreference currentPreference  = fakeRidePrefs[0];   // TODO 1 :  We should get it from the service
  // RidePreference currentPreference = RidePrefService.instance
  //     .currentPreference!;
  // @override
  // void initState() {
  //   super.initState();
  //    currentPreference = RidePrefService.instance.currentPreference ?? widget.currentPreference;
  // }
  // RidePreference? currentPreference = RidePrefService.instance.currentPreference;
  // currentPreference = RidePrefService.instance.currentPreference;
  // late RidePreference currentPreference;
  //
   RidesFilter currentFilter = RidesFilter( petAccepted: false);
   // RideSortType sortType = RideSortType.earliestDeparture;
  List<Ride> get matchingRides => RidesService.instance.getRidesFor(
      currentPreference, currentFilter);
  @override
  void initState() {
    super.initState();
    currentPreference = RidePrefService.instance.currentPreference!;
  }


  void onBackPressed() {
    Navigator.of(context).pop(); //  Back to the previous view
  }

  void onPreferencePressed() async {
    final newPreference = await showModalBottomSheet<RidePreference>(
      context: context,
      builder: (context) => RidePrefForm(
        initialPreference: currentPreference,
        onSubmit: (RidePreference updatedPreference) {
          // Step 1: Update the service
          RidePrefService.instance.setCurrentPreference(updatedPreference);
            RidePrefService.instance.setCurrentPreference(updatedPreference);
          // Step 2: Refresh the UI with the new preference
          setState(() {
            currentPreference = updatedPreference;
          });

          // Step 3: Close the modal
          Navigator.of(context).pop(updatedPreference);
        },
      ),
    );

    // Ensure UI is updated after modal closes
    if (newPreference != null) {
      setState(() {
        currentPreference = newPreference;
      });
    }
  }

  void onFilterPressed() async {
   
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
              ridePreference: currentPreference,
              onBackPressed: onBackPressed,
              onPreferencePressed: onPreferencePressed,
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

