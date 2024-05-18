// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildingModel _$BuildingModelFromJson(Map<String, dynamic> json) =>
    BuildingModel(
      id: json['Id'] as String,
      title: json['Title'] as String,
      address: json['Address'] as String,
      position: LatLng((json['Latitude'] as num).toDouble(),
          (json['Longitude'] as num).toDouble()),
      description: json['Description'] as String,
    );

Map<String, dynamic> _$BuildingModelToJson(BuildingModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Address': instance.address,
      'Position': instance.position,
      'Description': instance.description,
    };
