part of 'building_map_bloc.dart';

sealed class BuildingMapEvent extends Equatable {
  const BuildingMapEvent();

  @override
  List<Object?> get props => [];
}

final class FloorOpened extends BuildingMapEvent {
  final String buildingId;
  final String floorId;
  final int floorNumber;

  const FloorOpened(this.buildingId, this.floorNumber, this.floorId);

  @override
  List<Object> get props => [buildingId, floorNumber];
}

final class RouteCreated extends BuildingMapEvent {
  final String? fromId;
  final String toId;

  const RouteCreated({this.fromId, required this.toId});

  @override
  List<Object?> get props => [fromId, toId];
}
