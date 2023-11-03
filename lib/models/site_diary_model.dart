import 'package:json_annotation/json_annotation.dart';

part 'site_diary_model.g.dart';

@JsonSerializable()
class SiteDiaryModel {
  SiteDiaryModel({
    required this.siteLocation,
    required this.photos,
    required this.comments,
    required this.date,
    required this.area,
    required this.category,
    required this.tags,
    this.linkedEvent,
    this.createdBy,
    this.lastModified,
  });

  // Factory constructor to create a new instance from a map
  factory SiteDiaryModel.fromJson(Map<String, dynamic> json) =>
      _$SiteDiaryModelFromJson(json);
  final String siteLocation;
  final List<String> photos;
  final String comments;
  final DateTime date;
  final String area;
  final String category;
  final List<String> tags;
  final String? linkedEvent;

  final String? createdBy;
  final DateTime? lastModified;

  // Method to convert the instance to a map
  Map<String, dynamic> toJson() => _$SiteDiaryModelToJson(this);
}
