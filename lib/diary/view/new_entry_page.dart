import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:site_diary_app/bloc/site_diary_bloc.dart';
import 'package:site_diary_app/bloc/site_diary_state.dart';
import 'package:site_diary_app/constants.dart';
import 'package:site_diary_app/diary/view/widgets/comments_card.dart';
import 'package:site_diary_app/diary/view/widgets/details_card.dart';
import 'package:site_diary_app/diary/view/widgets/event_card.dart';
import 'package:site_diary_app/diary/view/widgets/location_display.dart';
import 'package:site_diary_app/diary/view/widgets/new_entry_subtitle.dart';
import 'package:site_diary_app/diary/view/widgets/next_button.dart';
import 'package:site_diary_app/diary/view/widgets/photos_card.dart';
import 'package:site_diary_app/models/site_diary_model.dart';
import 'package:site_diary_app/services/web_service.dart';

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({super.key});

  static String route = 'NewEntryPage';

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  final webService = WebService(backendUrl);
  final siteDiary = SiteDiaryModel(
    siteLocation: '',
    photos: [],
    comments: '',
    date: DateTime.now(),
    area: '',
    category: '',
    tags: [],
  );

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
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            SiteDiaryBloc(webService: webService, currentDiary: siteDiary),
        child: ColoredBox(
          color: Colors.blueGrey.shade100,
          child: BlocBuilder<SiteDiaryBloc, SiteDiaryState>(
            builder: (context, state) {
              return const SingleChildScrollView(
                child: Column(
                  children: [
                    LocationDisplay(),
                    NewEntrySubtitle(),
                    PhotosCard(),
                    CommentsCard(),
                    DetailsCard(),
                    EventCard(),
                    NextButton(),
                    SizedBox(
                      height: 21,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
