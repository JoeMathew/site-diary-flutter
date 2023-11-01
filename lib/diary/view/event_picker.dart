import 'package:flutter/material.dart';

class EventPicker extends StatefulWidget {
  const EventPicker({super.key});

  @override
  _EventPickerState createState() => _EventPickerState();
}

class _EventPickerState extends State<EventPicker> {
  // This is a mock list of areas. Replace with your data if needed.
  List<String> events = ['Event 1', 'Event 2', 'Event 3', 'Event 4'];
  String selectedEvent = '';
  final eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedEvent = events[0]; // Default to first area
    eventController.text = selectedEvent;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: eventController,
            decoration: InputDecoration(
              hintText: 'Select an event',
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () async {
                  await _selectEvent(context);
                },
              ),
            ),
            readOnly:
                true, // This will ensure the keyboard does not appear when tapped
          ),
        ),
      ],
    );
  }

  Future<void> _selectEvent(BuildContext context) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: events.map((String event) {
            return ListTile(
              title: Text(event),
              onTap: () {
                Navigator.pop(context, event);
              },
            );
          }).toList(),
        );
      },
    );

    if (selected != null && selected != selectedEvent) {
      setState(() {
        selectedEvent = selected;
        eventController.text = selectedEvent;
      });
    }
  }

  @override
  void dispose() {
    eventController.dispose();
    super.dispose();
  }
}
