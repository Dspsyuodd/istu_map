// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaypointImpl _$$WaypointImplFromJson(Map<String, dynamic> json) =>
    _$WaypointImpl(
      id: json['Id'] as String,
      buildingId: json['BuildingId'] as String,
      floor: (json['Floor'] as num).toInt(),
      type: (json['Type'] as num).toInt(),
      title: json['Title'] as String,
      description: json['Description'] as String,
      x: (json['X'] as num).toInt(),
      y: (json['Y'] as num).toInt(),
    );

Map<String, dynamic> _$$WaypointImplToJson(_$WaypointImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'BuildingId': instance.buildingId,
      'Floor': instance.floor,
      'Type': instance.type,
      'Title': instance.title,
      'Description': instance.description,
      'X': instance.x,
      'Y': instance.y,
    };
