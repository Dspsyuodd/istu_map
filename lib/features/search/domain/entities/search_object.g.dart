// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchObjectImpl _$$SearchObjectImplFromJson(Map<String, dynamic> json) =>
    _$SearchObjectImpl(
      id: json['Id'] as String,
      title: json['Title'] as String,
      type: (json['Type'] as num).toInt(),
    );

Map<String, dynamic> _$$SearchObjectImplToJson(_$SearchObjectImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Type': instance.type,
    };
