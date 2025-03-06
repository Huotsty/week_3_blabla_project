import 'package:week_3_blabla_project/model/ride/locations.dart';

import '../locations_repository.dart';

class MockLocationsRepository extends LocationsRepository{
  final List<Location> _khmerLocation = [
  Location(name: "Phnom Penh", country: Country.cambodia),
    Location(name: "Siem Reap", country: Country.cambodia),
    Location(name: "Battambang", country: Country.cambodia),
    Location(name: "Sihanoukvillee", country: Country.cambodia),
    Location(name: 'Kampot', country: Country.cambodia)
  ];
  // final Location phnompenh = Location(name: "Phnom Penh", country: Country.cambodia);
  // final Location siemreap = Location(name: "Siem Reap", country: Country.cambodia);
  // final Location battambang = Location(name: "Battambang", country: Country.cambodia);
  // final Location sihanoukville = Location(name: "Sihanoukvillee", country: Country.cambodia);
  // final Location kompot= Location(name: 'Kampot', country: Country.cambodia);
  @override
  List<Location> getLocations() {
    return _khmerLocation;
    
  }

  // @override
  // void addLocation(Location khmerlocation) {
  //   _khmerLocation.add(khmerlocation);
  // }

}