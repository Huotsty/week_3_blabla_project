import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/service/locations_service.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key, this.initLocation});
  final Location? initLocation;

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  late TextEditingController _controller;
  List<Location> _suggestions = [];
  List<Location> _searchHistory = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initLocation?.name ?? '');
    _loadSearchHistory();
  }

  Future<void> _loadSearchHistory() async {
    _searchHistory = LocationService.getSearchHistory();
    if (mounted) setState(() {});
  }

  void _search(String query) async {
    if (query.length < 2) {
      setState(() => _suggestions = []);
      return;
    }

    setState(() => _isLoading = true);
    List<Location> results = await LocationService.searchLocations(query);

    if (!mounted) return;

    setState(() {
      _suggestions = results;
      _isLoading = false;
    });
  }

  void _selectLocation(Location location) {
    LocationService.addToSearchHistory(location);
    Navigator.pop(context, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Location")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Search location",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: _search,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _suggestions.isEmpty && _controller.text.isEmpty
                  ? _buildHistoryList()
                  : _buildSuggestionsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryList() {
    return _searchHistory.isEmpty
        ? const Center(child: Text("No recent searches"))
        : ListView.builder(
      itemCount: _searchHistory.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.history, color: Colors.grey),
          title: Text(_searchHistory[index].name),
          subtitle: Text(_searchHistory[index].country.name),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _selectLocation(_searchHistory[index]),
        );
      },
    );
  }

  Widget _buildSuggestionsList() {
    return ListView.builder(
      itemCount: _suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_suggestions[index].name),
          subtitle: Text(_suggestions[index].country.name),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _selectLocation(_suggestions[index]),
        );
      },
    );
  }
}
