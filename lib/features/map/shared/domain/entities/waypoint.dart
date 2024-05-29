import 'package:freezed_annotation/freezed_annotation.dart';

part 'waypoint.freezed.dart';
part 'waypoint.g.dart';

@Freezed()
class Waypoint with _$Waypoint {
  const factory Waypoint({
    required String id,
    required String buildingId,
    required int floor,
    required int type,
    required String title,
    required String? description,
    required double x,
    required double y,
  }) = _Waypoint;

  factory Waypoint.fromJson(Map<String, dynamic> json) =>
      _$WaypointFromJson(json);
}
