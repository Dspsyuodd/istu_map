import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/features/map/shared/domain/entities/waypoint.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@Freezed()
class RouteFloor with _$RouteFloor {
  const factory RouteFloor({
    required List<Waypoint> route,
  }) = _RouteFloor;

  factory RouteFloor.fromJson(Map<String, dynamic> json) =>
      _$RouteFloorFromJson(json);
}

