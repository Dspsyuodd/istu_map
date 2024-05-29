import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/route.dart';

part 'route_floor.freezed.dart';
part 'route_floor.g.dart';

@Freezed()
class InternalRoute with _$InternalRoute {
  const factory InternalRoute({
    required String buildingId,
    required List<RouteFloor> floors,
  }) = _InternalRoute;

  factory InternalRoute.fromJson(Map<String, dynamic> json) =>
      _$InternalRouteFromJson(json);
}
