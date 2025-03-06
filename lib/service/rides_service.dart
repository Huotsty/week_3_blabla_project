import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/rides_repository.dart';


import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService { 
  //
  // static List<Ride> availableRides = fakeRides;
  //
  //
  // ///
  // ///  Return the relevant rides, given the passenger preferences
  // // ///
  // static List<Ride> getRidesFor(RidePreference preferences) {
  //
  //   // For now, just a test
  //   return availableRides.where( (ride) => ride.departureLocation == preferences.departure && ride.arrivalLocation == preferences.arrival).toList();
  // }
  static RidesService? _instance;
  final RidesRepository repository;

  RidesService._internal(this.repository);

  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("Ride service already initialize");
    }
  }

//  singleton accessor
  static RidesService get instance {
    if (_instance == null) {
      throw Exception('Ride service not yet initialize please init in main');
    }
    return _instance!;
  }

  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }

  // static List<Ride> getRidesFor(RidePreference currentPreference,  [RidesFilter? newFilter]) {
  //   return _instance!.getRides(currentPreference, newFilter);
  // }
  List<Ride> getRidesFor(RidePreference preferences, RidesFilter? filter) {
    List<Ride> matchingRides = repository
        .getRides(preferences, filter)
        .where((ride) =>
    ride.departureLocation == preferences.departure &&
        ride.arrivalLocation == preferences.arrival &&
        (filter == null || ride.petAccepted.petAccepted == filter.petAccepted))
        .toList();
    return matchingRides;
  }
}
class RidesFilter {
  final bool petAccepted;
  RidesFilter({required this.petAccepted});
}
class RideSortType{
  
} 