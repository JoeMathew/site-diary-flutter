import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationDisplay extends StatefulWidget {
  const LocationDisplay({super.key});

  @override
  State<LocationDisplay> createState() => _LocationDisplayState();
}

class _LocationDisplayState extends State<LocationDisplay> {
  final Location location = Location();
  String locationInfo = 'Fetching location...';

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  // Function to fetch and update location information
  Future<void> fetchLocation() async {
    LocationData? locationData;
    try {
      locationData = await location.getLocation();
      setState(() {
        locationInfo =
            'Latitude: ${locationData?.latitude}, Longitude: ${locationData?.longitude}';
      });
    } catch (e) {
      print('Error fetching location: $e');
      setState(() {
        locationInfo = 'Location not available';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              const SizedBox(width: 8),
              Text(
                locationInfo,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
