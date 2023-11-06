import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_diary_app/bloc/site_diary_bloc.dart';
import 'package:site_diary_app/diary/view/widgets/area_picker.dart';
import 'package:site_diary_app/diary/view/widgets/category_picker.dart';

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
      margin: const EdgeInsets.all(14),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 28,
        child: Padding(
          padding: const EdgeInsets.all(14),
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
                onTap: () {
                  _selectDate(context).then((_) {
                    // Update the date in the bloc after selection
                    context.read<SiteDiaryBloc>().updateDate(selectedDate);
                  });
                },
              ),
              const SizedBox(height: 14),
              AreaPicker(
                onSelected: (String area) {
                  // Update the area in the bloc when an area is selected
                  context.read<SiteDiaryBloc>().updateArea(area);
                },
              ),
              const SizedBox(height: 14),
              CategoryPicker(
                onSelected: (String category) {
                  // Update the category in the bloc when a category is selected
                  context.read<SiteDiaryBloc>().updateCategory(category);
                },
              ),
              const SizedBox(height: 14),
              TextField(
                controller: tagsController,
                decoration: const InputDecoration(
                  hintText: 'Tags',
                ),
                onSubmitted: (String tagsInput) {
                  // Update the tags in the bloc
                  context.read<SiteDiaryBloc>().updateTags(tagsInput);
                },
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
