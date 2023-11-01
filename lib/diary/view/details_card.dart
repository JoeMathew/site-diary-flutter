import 'package:flutter/material.dart';

import 'package:site_diary_app/diary/view/area_picker.dart';

import 'package:site_diary_app/diary/view/category_picker.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({super.key});

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  List<String> thumbnails = []; // Mock list of image thumbnails

  DateTime selectedDate = DateTime.now(); // Initially set to the current date
  TextEditingController dateController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = '${selectedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

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
              const Text(
                'Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),
              const Divider(),
              const SizedBox(height: 14),
              TextField(
                controller: dateController,
                readOnly: true, // Makes the TextField not editable by the user
                decoration: InputDecoration(
                  hintText: 'Select Date',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                onTap: () => _selectDate(context), // Opens DatePicker on tap
              ),
              const SizedBox(height: 14),
              const AreaPicker(),
              const SizedBox(height: 14),
              const CategoryPicker(),
              const SizedBox(height: 14),
              TextField(
                controller: tagsController,
                decoration: const InputDecoration(
                  hintText: 'Tags',
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dateController.text = '${selectedDate.toLocal()}'.split(' ')[0];
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
}
