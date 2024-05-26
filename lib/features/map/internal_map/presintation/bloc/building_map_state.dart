part of 'building_map_bloc.dart';

final class BuildingMapState extends Equatable {
  const BuildingMapState(this.status, this.floor, this.floorImage);
  final BuildingMapStatus status;
  final Floor? floor;
  final Uint8List? floorImage;

  const BuildingMapState.initial()
      : this(BuildingMapStatus.initial, null, null);

  @override
  List<Object?> get props => [status, floor, floorImage];
}

enum BuildingMapStatus { initial, loading, success, route, failure }
