import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_diary_app/bloc/site_diary_state.dart';
import 'package:site_diary_app/models/site_diary_model.dart';

class SiteDiaryBloc extends Cubit<SiteDiaryState> {
  SiteDiaryBloc() : super(SiteDiaryInitial());
  late SiteDiaryModel currentDiary;

  // Handler for updating the diary
  void updateDiary(SiteDiaryModel siteDiary) {
    currentDiary = siteDiary;
    emit(SiteDiaryUpdated(currentDiary));
  }

  // Handler for submitting the diary
  void submitDiary() {
    
    emit(SiteDiarySubmitted());
  }

}
