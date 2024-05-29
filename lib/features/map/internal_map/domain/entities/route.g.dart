// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteFloorImpl _$$RouteFloorImplFromJson(Map<String, dynamic> json) =>
    _$RouteFloorImpl(
      route: (json['Route'] as List<dynamic>)
          .map((e) => Waypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RouteFloorImplToJson(_$RouteFloorImpl instance) =>
    <String, dynamic>{
      'Route': instance.route.map((e) => e.toJson()).toList(),
    };
