import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/rides_repository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';

import '../../model/ride/locations.dart';
import '../../model/user/user.dart';

class MockRidesRepository extends RidesRepository {
  // Mock users
  final List<User> driver = [
    User(
      firstName: "Kannika",
      lastName: "Sok",
      email: "kannika@example.com",
      phone: "+12345678",
      profilePicture: "https://example.com/profiles/kannika.jpg",
      verifiedProfile: true,
    ),
    User(
      firstName: "Chaylim",
      lastName: "Cheng",
      email: "chaylim@example.com",
      phone: "+12345678",
      profilePicture: "https://example.com/profiles/chaylim.jpg",
      verifiedProfile: true,
    ),
    User(
      firstName: "Mengtech",
      lastName: "Hem",
      email: "mengtech@example.com",
      phone: "+12345678",
      profilePicture: "https://example.com/profiles/mengtech.jpg",
      verifiedProfile: false,
    ),
    User(
      firstName: "Limhao",
      lastName: "Tan",
      email: "limhao@example.com",
      phone: "+12345678",
      profilePicture: "https://example.com/profiles/limhao.jpg",
      verifiedProfile: true,
    ),
    User(
      firstName: "Sovanda",
      lastName: "Kim",
      email: "sovanda@example.com",
      phone: "+12345678",
      profilePicture: "https://example.com/profiles/sovanda.jpg",
      verifiedProfile: false,
    ),
  ];

  // Mock rides data
  late final List<Ride> _rides;

  MockRidesRepository() {
    _rides = [
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 5, minutes: 30)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 7, minutes: 30)),
        driver: driver[0],
        availableSeats: 2,
        pricePerSeat: 10.0,
        petAccepted: RidesFilter(petAccepted: false),
      ),
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 20)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 22)),
        driver: driver[1],
        availableSeats: 0,
        pricePerSeat: 12.0,
        petAccepted: RidesFilter(petAccepted: false),
      ),
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 5)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
        driver: driver[2],
        availableSeats: 1,
        pricePerSeat: 8.0,
        petAccepted: RidesFilter(petAccepted: false),
      ),
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 20)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 22)),
        driver: driver[3],
        availableSeats: 2,
        pricePerSeat: 15.0,
        petAccepted: RidesFilter(petAccepted: true),
      ),
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 5)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
        driver: driver[4],
        availableSeats: 1,
        pricePerSeat: 9.0,
        petAccepted: RidesFilter(petAccepted: false),
      ),
    ];
  }

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _rides;
  }
}
