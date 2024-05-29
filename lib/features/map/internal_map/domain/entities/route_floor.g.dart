// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_floor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InternalRouteImpl _$$InternalRouteImplFromJson(Map<String, dynamic> json) =>
    _$InternalRouteImpl(
      buildingId: json['BuildingId'] as String,
      floors: (json['Floors'] as List<dynamic>)
          .map((e) => RouteFloor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InternalRouteImplToJson(_$InternalRouteImpl instance) =>
    <String, dynamic>{
      'BuildingId': instance.buildingId,
      'Floors': instance.floors.map((e) => e.toJson()).toList(),
    };
