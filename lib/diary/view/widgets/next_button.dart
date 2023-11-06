import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_diary_app/bloc/site_diary_bloc.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _saveData() async {
      await context.read<SiteDiaryBloc>().submitDiary();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 28,
        child: Center(
          child: ElevatedButton(
            onPressed: _saveData,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightGreenAccent.shade700,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 56,
              height: 50,
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
