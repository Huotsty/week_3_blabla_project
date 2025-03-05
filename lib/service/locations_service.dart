import 'package:week_3_blabla_project/model/ride/locations.dart';


import '../repository/locations_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {

  // static const List<Location> availableLocations = fakeLocations;

  // Static private instance
  static LocationsService? _instance;
  // Access to past preferences
   final LocationsRepository repository;
//   current location
//   Location? currentLocation;
  ///
  /// Private constructor
  ///
  LocationsService._internal(this.repository);
///
/// Initialize
///
  static void initialize(LocationsRepository repository){
   if(_instance == null ){
     _instance = LocationsService._internal(repository);
   }else{
     throw Exception("Location service already initialize");
   }
  }
//   Singleton accessor
  static LocationsService get instance{
    if(_instance == null){
      throw Exception('LocationService is not yet initialize please init in main');
    }
    return _instance!;
  }
  // Location? get _currentLcation{
  //
  // }
List<Location>getLocations(){
    return repository.getLocations();
}
}