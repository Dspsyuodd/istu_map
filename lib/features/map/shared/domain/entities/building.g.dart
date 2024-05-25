// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuildingImpl _$$BuildingImplFromJson(Map<String, dynamic> json) =>
    _$BuildingImpl(
      id: json['Id'] as String,
      title: json['Title'] as String,
      address: json['Address'] as String,
      position: const LatLngJsonConverter()
          .fromJson(json['Position'] as Map<String, dynamic>),
      description: json['Description'] as String,
      floors: (json['Floors'] as List<dynamic>)
          .map((e) => FloorInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BuildingImplToJson(_$BuildingImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Address': instance.address,
      'Position': const LatLngJsonConverter().toJson(instance.position),
      'Description': instance.description,
      'Floors': instance.floors.map((e) => e.toJson()).toList(),
    };

_$FloorInfoImpl _$$FloorInfoImplFromJson(Map<String, dynamic> json) =>
    _$FloorInfoImpl(
      floorNumber: (json['FloorNumber'] as num).toInt(),
      floorId: json['FloorId'] as String,
    );

Map<String, dynamic> _$$FloorInfoImplToJson(_$FloorInfoImpl instance) =>
    <String, dynamic>{
      'FloorNumber': instance.floorNumber,
      'FloorId': instance.floorId,
    };
