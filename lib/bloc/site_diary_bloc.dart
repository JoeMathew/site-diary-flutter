import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_diary_app/bloc/site_diary_state.dart';
import 'package:site_diary_app/models/site_diary_model.dart';
import 'package:http/http.dart' as http;
import 'package:site_diary_app/services/web_service.dart';

class SiteDiaryBloc extends Cubit<SiteDiaryState> {
  SiteDiaryBloc({required this.webService, required this.currentDiary})
      : super(SiteDiaryInitial());
  final WebService webService;
  SiteDiaryModel currentDiary;

  void updateDiary(SiteDiaryModel siteDiary) {
    currentDiary = siteDiary;
    // emit(SiteDiaryUpdated(currentDiary));
  }

  void updatePhotos(List<String> photos) {
    currentDiary = currentDiary.copyWith(photos: photos);
  }

  void updateComments(String comments) {
    currentDiary = currentDiary.copyWith(comments: comments);
  }

  void updateDate(DateTime date) {
    currentDiary = currentDiary.copyWith(date: date);
  }

  void updateArea(String area) {
    currentDiary = currentDiary.copyWith(area: area);
  }

  void updateCategory(String category) {
    currentDiary = currentDiary.copyWith(category: category);
  }

  void updateTags(String tags) {
    // Split the tags string by commas to get a List of Strings.
    var tagList = tags.split(',');

    // Remove any leading or trailing whitespace from each tag.
    tagList = tagList.map((tag) => tag.trim()).toList();

    currentDiary = currentDiary.copyWith(tags: tagList);
  }

  void updateLinkedEvent(String event) {
    currentDiary = currentDiary.copyWith(linkedEvent: event);
  }

  Future<void> submitDiary() async {
    try {
      // Step 1: Upload the photos and get the URLs
      final photoUrls = await webService.uploadPhotos(currentDiary.photos);

      // Step 2: Update the currentDiary with the photo URLs
      currentDiary = currentDiary.copyWith(photos: photoUrls);

      // Step 3: Submit the updated diary to the backend
      await webService.submitDiary(currentDiary);

      // If successful, emit a SiteDiarySubmitted state.
      emit(SiteDiarySubmitted());
    } catch (e) {
      // If an exception occurs, emit a SiteDiarySubmissionFailed state with the error.
      emit(SiteDiarySubmissionFailed('Exception occurred: $e'));
    }
  }
}
