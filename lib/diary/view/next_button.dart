import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  Future<void> _saveData() async {
    //Save data to backend
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _saveData,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      child: const Text(
        'Next',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
