// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObjectCardImpl _$$ObjectCardImplFromJson(Map<String, dynamic> json) =>
    _$ObjectCardImpl(
      objectId: json['ObjectId'] as String,
      title: json['Title'] as String,
      description: json['Description'] as String?,
      address: json['Address'] as String,
      contentType: (json['ContentType'] as num).toInt(),
      imageIds:
          (json['ImageIds'] as List<dynamic>).map((e) => e as String).toList(),
      required: json['Required'],
    );

Map<String, dynamic> _$$ObjectCardImplToJson(_$ObjectCardImpl instance) =>
    <String, dynamic>{
      'ObjectId': instance.objectId,
      'Title': instance.title,
      'Description': instance.description,
      'Address': instance.address,
      'ContentType': instance.contentType,
      'ImageIds': instance.imageIds,
      'Required': instance.required,
    };
