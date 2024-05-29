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

class PositionChanged extends MapEvent {
  const PositionChanged();

  @override
  List<Object> get props => [];
}

class CloseToBuilding extends MapEvent {
  const CloseToBuilding(this.building);
  final Building? building;

  @override
  List<Object?> get props => [building];
}

class ExternalLessonSelected extends MapEvent {
  const ExternalLessonSelected(this.lesson);
  final Lesson lesson;

  @override
  List<Object> get props => [lesson];
}

class ExternalRouteCreatedToLesson extends MapEvent {
  const ExternalRouteCreatedToLesson(this.lesson);
  final Lesson lesson;

  @override
  List<Object> get props => [lesson];
}
