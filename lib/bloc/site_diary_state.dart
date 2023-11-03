import 'package:equatable/equatable.dart';
import 'package:site_diary_app/models/site_diary_model.dart';

abstract class SiteDiaryState extends Equatable {}

class SiteDiaryInitial extends SiteDiaryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SiteDiaryUpdated extends SiteDiaryState {
  SiteDiaryUpdated(this.siteDiary);
  final SiteDiaryModel siteDiary;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SiteDiarySubmitted extends SiteDiaryState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
