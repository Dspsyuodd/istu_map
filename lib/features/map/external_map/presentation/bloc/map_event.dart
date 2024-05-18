part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class MapLoaded extends MapEvent {
  const MapLoaded();
}

class RouteCreated extends MapEvent {
  const RouteCreated({
    required this.to,
  });
  final Building to;
}
