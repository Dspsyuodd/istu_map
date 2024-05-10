// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalRouteModel _$ExternalRouteModelFromJson(Map<String, dynamic> json) =>
    ExternalRouteModel(
      totalTime: DateTime.parse(json['TotalTime'] as String),
      points: (json['points'] as List<dynamic>)
          .map((e) => LatLng(e['Latitude'], e['Longitude']))
          .toList(),
    );

Map<String, dynamic> _$ExternalRouteModelToJson(ExternalRouteModel instance) =>
    <String, dynamic>{
      'totalTime': instance.totalTime.toIso8601String(),
      'points': instance.points,
    };
