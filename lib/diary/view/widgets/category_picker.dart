import 'package:flutter/material.dart';

typedef OnCategorySelected = void Function(String category);

class CategoryPicker extends StatefulWidget {
  // Define a callback function parameter

  const CategoryPicker({
    required this.onSelected,
    super.key,
  });
  final OnCategorySelected onSelected;

  @override
  _CategoryPickerState createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  // This is a mock list of areas. Replace with your data if needed.
  List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
  ];
  String selectedCategory = '';
  final categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedCategory = categories[0]; // Default to first area
    categoryController.text = selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: categoryController,
            decoration: InputDecoration(
              hintText: 'Select an Area',
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () async {
                  await _selectCategory(context);
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

  Future<void> _selectCategory(BuildContext context) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: categories.map((String category) {
            return ListTile(
              title: Text(category),
              onTap: () {
                Navigator.pop(context, category);
              },
            );
          }).toList(),
        );
      },
    );

    if (selected != null && selected != selectedCategory) {
      setState(() {
        selectedCategory = selected;
        categoryController.text = selectedCategory;
      });
      widget.onSelected(
        selectedCategory,
      ); // Invoke the callback with the selected category
    }
  }

  @override
  void dispose() {
    categoryController.dispose();
    super.dispose();
  }
}
