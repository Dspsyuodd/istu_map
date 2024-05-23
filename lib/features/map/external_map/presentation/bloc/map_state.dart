part of 'map_bloc.dart';

final class MapState extends Equatable {
  final List<Building> buildings;
  final ExternalRoute? route;
  final MapStatus status;
  final LatLng currentPosition;
  final Building? nearestBuillding;

  const MapState(this.buildings, this.route, this.status, this.currentPosition, this.nearestBuillding);

  const MapState.initial() : this(const [], null, MapStatus.initial, const LatLng(0, 0), null);

  @override
  List<Object?> get props => [buildings, route, status, currentPosition, nearestBuillding];
}

enum MapStatus { initial, loading, success, failure }
