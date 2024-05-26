// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
      startTime: json['StartTime'] as String,
      endTime: json['EndTime'] as String,
      title: json['Title'] as String,
      lector: json['Lector'] as String,
      audience: json['Audience'] as String,
      audienceId: json['AudienceId'] as String,
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'StartTime': instance.startTime,
      'EndTime': instance.endTime,
      'Title': instance.title,
      'Lector': instance.lector,
      'Audience': instance.audience,
      'AudienceId': instance.audienceId,
    };
