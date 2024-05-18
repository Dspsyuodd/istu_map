part of 'map_bloc.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

final class MapInitial extends MapState {}

final class MapLoadInProgress extends MapState {}

final class MapLoadSuccess extends MapState {
  final List<Building> buildings;
  final ExternalRoute? route;

  const MapLoadSuccess(this.buildings, this.route);
}

final class MapLoadFailure extends MapState {}
