// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FloorImpl _$$FloorImplFromJson(Map<String, dynamic> json) => _$FloorImpl(
      buildingId: json['BuildingId'] as String,
      floorId: json['FloorId'] as String,
      floorNumber: (json['FloorNumber'] as num).toInt(),
      objects: (json['Objects'] as List<dynamic>)
          .map((e) => Waypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      edges: (json['Edges'] as List<dynamic>)
          .map((e) => Edge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FloorImplToJson(_$FloorImpl instance) =>
    <String, dynamic>{
      'BuildingId': instance.buildingId,
      'FloorId': instance.floorId,
      'FloorNumber': instance.floorNumber,
      'Objects': instance.objects.map((e) => e.toJson()).toList(),
      'Edges': instance.edges.map((e) => e.toJson()).toList(),
    };
