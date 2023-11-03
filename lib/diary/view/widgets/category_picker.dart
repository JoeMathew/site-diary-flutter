import 'package:flutter/material.dart';

class CategoryPicker extends StatefulWidget {
  const CategoryPicker({super.key});

  @override
  _CategoryPickerState createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  // This is a mock list of areas. Replace with your data if needed.
  List<String> areas = ['Category 1', 'Category 2', 'Category 3', 'Category 4'];
  String selectedArea = '';
  final areaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedArea = areas[0]; // Default to first area
    areaController.text = selectedArea;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: areaController,
            decoration: InputDecoration(
              hintText: 'Select an Area',
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () async {
                  await _selectArea(context);
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

  Future<void> _selectArea(BuildContext context) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: areas.map((String area) {
            return ListTile(
              title: Text(area),
              onTap: () {
                Navigator.pop(context, area);
              },
            );
          }).toList(),
        );
      },
    );

    if (selected != null && selected != selectedArea) {
      setState(() {
        selectedArea = selected;
        areaController.text = selectedArea;
      });
    }
  }

  @override
  void dispose() {
    areaController.dispose();
    super.dispose();
  }
}
