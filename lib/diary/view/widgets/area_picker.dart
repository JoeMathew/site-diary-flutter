import 'package:flutter/material.dart';

typedef OnAreaSelected = void Function(String area);

class AreaPicker extends StatefulWidget {
  // Define a callback function parameter

  const AreaPicker({
    required this.onSelected,
    super.key,
  });
  final OnAreaSelected onSelected;

  @override
  _AreaPickerState createState() => _AreaPickerState();
}

class _AreaPickerState extends State<AreaPicker> {
  // This is a mock list of areas. Replace with your data if needed.
  List<String> areas = ['Area 1', 'Area 2', 'Area 3', 'Area 4'];
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
              hintText: 'Select Area',
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
      widget.onSelected(
        selectedArea,
      ); // Invoke the callback with the selected area
    }
  }

  @override
  void dispose() {
    areaController.dispose();
    super.dispose();
  }
}
