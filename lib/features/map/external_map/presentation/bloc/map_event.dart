part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object?> get props => [];
}

class MapLoaded extends MapEvent {
  const MapLoaded();
}

class InitGeolocation extends MapEvent {
  const InitGeolocation();
}

class RouteCreated extends MapEvent {
  const RouteCreated({
    required this.to,
  });
  final Building to;

  @override
  List<Object> get props => [to];
}

class PositionChanged  extends MapEvent {
  final LatLng position;

  const PositionChanged(this.position);

  @override
  List<Object> get props => [position];
}

class CloseToBuilding extends MapEvent {
  const CloseToBuilding(this.building);
  final Building? building;

  @override
  List<Object?> get props => [building];
}