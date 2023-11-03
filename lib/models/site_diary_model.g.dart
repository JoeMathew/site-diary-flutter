// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteDiaryModel _$SiteDiaryModelFromJson(Map<String, dynamic> json) =>
    SiteDiaryModel(
      siteLocation: json['siteLocation'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      comments: json['comments'] as String,
      date: DateTime.parse(json['date'] as String),
      area: json['area'] as String,
      category: json['category'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      linkedEvent: json['linkedEvent'] as String?,
      createdBy: json['createdBy'] as String?,
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
    );

Map<String, dynamic> _$SiteDiaryModelToJson(SiteDiaryModel instance) =>
    <String, dynamic>{
      'siteLocation': instance.siteLocation,
      'photos': instance.photos,
      'comments': instance.comments,
      'date': instance.date.toIso8601String(),
      'area': instance.area,
      'category': instance.category,
      'tags': instance.tags,
      'linkedEvent': instance.linkedEvent,
      'createdBy': instance.createdBy,
      'lastModified': instance.lastModified?.toIso8601String(),
    };
