import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/edge.dart';
import 'package:istu_map/features/map/shared/domain/entities/waypoint.dart';

part 'floor.freezed.dart';
part 'floor.g.dart';

@Freezed()
class Floor with _$Floor {
  const factory Floor({
    required String buildingId,
    required String floorId,
    required int floorNumber,
    required List<Waypoint> objects,
    required List<Edge> edges,
  }) = _Floor;

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);
}
