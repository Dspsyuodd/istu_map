part of 'building_map_bloc.dart';

final class BuildingMapState extends Equatable {
  const BuildingMapState(this.status, this.floor, this.floorImage, this.route,
      this.startId, this.endId);
  final BuildingMapStatus status;
  final Floor? floor;
  final Uint8List? floorImage;
  final InternalRoute? route;
  final String? startId;
  final String? endId;

  const BuildingMapState.initial()
      : this(BuildingMapStatus.initial, null, null, null, null, null);

  @override
  List<Object?> get props => [status, floor, floorImage, route, startId, endId];
}

enum BuildingMapStatus { initial, loading, success, route, failure }
