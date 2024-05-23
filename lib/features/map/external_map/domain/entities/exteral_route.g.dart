// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exteral_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExternalRouteImpl _$$ExternalRouteImplFromJson(Map<String, dynamic> json) =>
    _$ExternalRouteImpl(
      totalTime:
          const DateTimeJsonConverter().fromJson(json['TotalTime'] as String),
      points: (json['Points'] as List<dynamic>)
          .map((e) =>
              const LatLngJsonConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExternalRouteImplToJson(_$ExternalRouteImpl instance) =>
    <String, dynamic>{
      'TotalTime': const DateTimeJsonConverter().toJson(instance.totalTime),
      'Points':
          instance.points.map(const LatLngJsonConverter().toJson).toList(),
    };
