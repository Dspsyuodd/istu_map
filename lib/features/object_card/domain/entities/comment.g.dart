// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['Id'] as String,
      creatorId: json['CreatorId'] as String,
      text: json['Text'] as String,
      creationData: DateTime.parse(json['CreationData'] as String),
      creatorName: json['CreatorName'] as String,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'CreatorId': instance.creatorId,
      'Text': instance.text,
      'CreationData': instance.creationData.toIso8601String(),
      'CreatorName': instance.creatorName,
    };
