import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:site_diary_app/diary/view/details_card.dart';
import 'package:site_diary_app/diary/view/location_display.dart';

import 'package:site_diary_app/diary/view/new_entry_subtitle.dart';

import 'package:site_diary_app/diary/view/photos_card.dart';

import 'package:site_diary_app/diary/view/comments_card.dart';

import 'package:site_diary_app/diary/view/event_card.dart';

import 'package:site_diary_app/diary/view/next_button.dart';

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({super.key});

  static String route = 'NewEntryPage';

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'New Diary',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ColoredBox(
        color: Colors.blueGrey.shade100,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              LocationDisplay(),
              NewEntrySubtitle(),
              PhotoCard(),
              CommentsCard(),
              DetailsCard(),
              EventCard(),
              NextButton(),
              SizedBox(
                height: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
