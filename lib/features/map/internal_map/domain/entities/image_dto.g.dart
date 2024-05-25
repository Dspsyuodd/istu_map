// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageDtoImpl _$$ImageDtoImplFromJson(Map<String, dynamic> json) =>
    _$ImageDtoImpl(
      id: json['Id'] as String,
      objectId: json['ObjectId'] as String,
      title: json['Title'] as String,
    );

Map<String, dynamic> _$$ImageDtoImplToJson(_$ImageDtoImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ObjectId': instance.objectId,
      'Title': instance.title,
    };

_$GetImagesResultImpl _$$GetImagesResultImplFromJson(
        Map<String, dynamic> json) =>
    _$GetImagesResultImpl(
      images: (json['Images'] as List<dynamic>)
          .map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetImagesResultImplToJson(
        _$GetImagesResultImpl instance) =>
    <String, dynamic>{
      'Images': instance.images.map((e) => e.toJson()).toList(),
    };
