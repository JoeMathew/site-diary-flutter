import 'package:flutter/material.dart';

class NewEntrySubtitle extends StatelessWidget {
  const NewEntrySubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Add to site diary',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Tooltip(
            message: 'Placeholder text for the tooltip.',
            child: IconButton(
              icon: const Icon(
                Icons.help_outline,
                color: Colors.blue,
              ),
              onPressed: () {
                // You can still handle additional actions when the icon is pressed.
              },
            ),
          ),
        ),
      ],
    );
  }
}
