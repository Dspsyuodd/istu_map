// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalRouteModel _$ExternalRouteModelFromJson(Map<String, dynamic> json) =>
    ExternalRouteModel(
      totalTime: DateTime.parse("0000-00-00 ${json['TotalTime'] as String}"),
      points: (json['Points'] as List<dynamic>)
          .map((e) => LatLng((e["Latitude"] as num).toDouble(),
              (e["Longitude"] as num).toDouble()))
          .toList(),
    );

Map<String, dynamic> _$ExternalRouteModelToJson(ExternalRouteModel instance) =>
    <String, dynamic>{
      'TotalTime': instance.totalTime.toIso8601String(),
      'Points': instance.points,
    };
