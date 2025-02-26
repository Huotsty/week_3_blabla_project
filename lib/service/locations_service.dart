import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';

class LocationService {
  static const List<Location> availableLocations = fakeLocations;
  static final List<Location> _searchHistory = []; // Store past searches

  static Future<List<Location>> searchLocations(String query) async {
    await Future.delayed(const Duration(milliseconds: 300)); // Simulate delay
    if (query.length < 2) return [];

    return availableLocations
        .where((loc) => loc.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  static List<Location> getSearchHistory() {
    return _searchHistory;
  }

  static void addToSearchHistory(Location location) {
    
    _searchHistory.removeWhere((loc) => loc.name == location.name);
    _searchHistory.insert(0, location);

    
    if (_searchHistory.length > 10) {
      _searchHistory.removeLast();
    }
  }
}
