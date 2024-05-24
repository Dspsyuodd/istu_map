// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteImpl _$$RouteImplFromJson(Map<String, dynamic> json) => _$RouteImpl(
      buildingId: json['BuildingId'] as String,
      floorId: json['FloorId'] as String,
      floorNumber: (json['FloorNumber'] as num).toInt(),
      objects: (json['Objects'] as List<dynamic>)
          .map((e) => Waypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RouteImplToJson(_$RouteImpl instance) =>
    <String, dynamic>{
      'BuildingId': instance.buildingId,
      'FloorId': instance.floorId,
      'FloorNumber': instance.floorNumber,
      'Objects': instance.objects.map((e) => e.toJson()).toList(),
    };
