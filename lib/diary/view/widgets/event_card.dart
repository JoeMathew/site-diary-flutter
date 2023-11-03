import 'package:flutter/material.dart';
import 'package:site_diary_app/diary/view/widgets/event_picker.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key});

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  // This is a mock list of image thumbnails. Replace with your data.
  bool _isChecked = false;
  List<String> thumbnails = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 28,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Link to existing event?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              const Divider(),
              const SizedBox(height: 14),
              const EventPicker(),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
