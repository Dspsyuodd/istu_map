import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/edge.dart';
import 'package:istu_map/features/map/shared/domain/entities/waypoint.dart';

part 'floor.freezed.dart';
part 'floor.g.dart';

@Freezed()
class Floor with _$Floor {
  const factory Floor({
    required final String buildingId,
    required final String floorId,
    required final int floorNumber,
    required final List<Waypoint> objects,
    required final List<Edge> edges,
  }) = _Floor;

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);
}
