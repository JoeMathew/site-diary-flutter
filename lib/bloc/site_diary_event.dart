import 'package:site_diary_app/models/site_diary_model.dart';

abstract class SiteDiaryEvent {}

class UpdateSiteDiary extends SiteDiaryEvent {
  UpdateSiteDiary(this.siteDiary);
  final SiteDiaryModel siteDiary;
}

class UpdatePhotos extends SiteDiaryEvent {
  UpdatePhotos(this.photos);
  final List<String> photos;
}

class UpdateComments extends SiteDiaryEvent {
  UpdateComments(this.comments);
  final String comments;
}

class UpdateDate extends SiteDiaryEvent {
  UpdateDate(this.date);
  final DateTime date;
}

class UpdateArea extends SiteDiaryEvent {
  UpdateArea(this.area);
  final String area;
}

class UpdateCategory extends SiteDiaryEvent {
  UpdateCategory(this.category);
  final String category;
}

class UpdateTags extends SiteDiaryEvent {
  UpdateTags(this.tags);
  final String tags;
}

class UpdateLinkedEvent extends SiteDiaryEvent {
  UpdateLinkedEvent(this.event);
  final String event;
}

class SubmitSiteDiary extends SiteDiaryEvent {}
