import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/waypoint.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@Freezed()
class Route with _$Route {
  const factory Route({
    required String buildingId,
    required String floorId,
    required int floorNumber,
    required List<Waypoint> objects,
  }) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}
