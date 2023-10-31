import 'package:flutter/material.dart';
import 'package:location/location.dart';

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({super.key});

  static String route = 'NewEntryPage';

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
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
            'Latitude: ${locationData?.latitude}\nLongitude: ${locationData?.longitude}';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('New Diary'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.blueGrey.shade100,
        child: Column(
          children: <Widget>[
            Container(
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
            ),
            const Expanded(
              child: Center(
                child: Text('Add your new diary entry here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
