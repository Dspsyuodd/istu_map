import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/data/json_converters/lat_lng_json_converter.dart';
import 'package:latlong2/latlong.dart';

part 'building.freezed.dart';
part 'building.g.dart';

@Freezed()
class Building with _$Building {
  const factory Building({
    required String id,
    required String title,
    required String address,
    @LatLngJsonConverter() required LatLng position,
    required String description,
    required List<FloorInfo> floors,
  }) = _Building;

  factory Building.fromJson(Map<String, dynamic> json) =>
      _$BuildingFromJson(json);
}

@Freezed()
class FloorInfo with _$FloorInfo {
  const factory FloorInfo({
    required int floorNumber,
    required String floorId,
  }) = _FloorInfo;

  factory FloorInfo.fromJson(Map<String, dynamic> json) =>
      _$FloorInfoFromJson(json);
}
