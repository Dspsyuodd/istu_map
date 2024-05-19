part of 'map_bloc.dart';

final class MapState extends Equatable {
  final List<Building> buildings;
  final ExternalRoute? route;
  final MapStatus status;

  const MapState(this.buildings, this.route, this.status);

  const MapState.initial()
      : this(const [], null, MapStatus.initial);

  @override
  List<Object?> get props => [buildings, route, status];
}

enum MapStatus { initial, loading, success, failure }
