import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/get_route_to_lesson.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/get_route_to_object.dart';
import 'package:istu_map/features/user/domain/entities/lesson.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/usecases/usecase.dart';
import '../../domain/entities/exteral_route.dart';
import '../../domain/repositories/geoposition_repository.dart';
import '../../domain/usecases/get_route.dart';
import '../../domain/usecases/load_map.dart';
import '../../../shared/domain/entities/building.dart';
import 'package:latlong2/latlong.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final GetExternalRoute getRoute;
  final LoadMap loadMap;
  final GeopositionRepository geopositionRepository;
  final GetRouteToLesson getRouteToLesson;
  final GetRouteToObject getRouteToObject;

  List<Building> _buildings = [];
  ExternalRoute? _route;
  String? _routeEndpoint;
  var _currentPosition = const LatLng(0.0, 0.0);
  Building? _nearestBuillding;
  String? auditoryEndpointId;

  MapBloc(this.getRoute, this.loadMap, this.geopositionRepository,
      this.getRouteToLesson, this.getRouteToObject)
      : super(const MapState.initial()) {
    on<MapEvent>((event, emit) async {
      if (event is RouteCreatedToObject) {
        emit(MapState(_buildings, _route, MapStatus.loading, _currentPosition,
            _nearestBuillding, auditoryEndpointId));
        var routeEither = await getRouteToObject(
            GetRouteToObjectParams(event.objectId, _currentPosition));
        routeEither.fold(
          (l) => _emitError(l, emit),
          (r) {
            _route = r;
            auditoryEndpointId = event.objectId;
            emit(MapState(_buildings, _route, MapStatus.success,
                _currentPosition, _nearestBuillding, auditoryEndpointId));
          },
        );
      }
      log(event.runtimeType.toString());
      if (event is RouteRemoved) {
        _route = null;
        emit(MapState(_buildings, _route, MapStatus.success, _currentPosition,
            _nearestBuillding, auditoryEndpointId));
      }
      if (event is ExternalLessonSelected) {
        if (_route != null) {
          await _createRouteToLesson(event.lesson, emit);
        }
      }

      if (event is ExternalRouteCreatedToLesson) {
        await _createRouteToLesson(event.lesson, emit);
      }

      if (event is PositionChanged && _route != null) {
        await _createRoute(_routeEndpoint!, emit);
      }

      if (event is CloseToBuilding) {
        if (_nearestBuillding != event.building) {
          _nearestBuillding = event.building;
          emit(MapState(_buildings, _route, MapStatus.success, _currentPosition,
              event.building, auditoryEndpointId));
        }
      }

      if (event is InitGeolocation) {
        var position = await geopositionRepository.getCurrentPosition();
        position.fold(
          (l) => _emitError(l, emit),
          (r) {
            emit(MapState(_buildings, _route, MapStatus.initial, r,
                _nearestBuillding, auditoryEndpointId));
          },
        );

        geopositionRepository.addListener((position) {
          position.fold(
            (l) => _emitError(l, emit),
            (r) {
              if (_currentPosition != r) {
                _currentPosition = r;
                add(const PositionChanged());
              }
              if (_nearestBuillding != null) {
                var distanse = Geolocator.distanceBetween(
                    _currentPosition.latitude,
                    _currentPosition.longitude,
                    _nearestBuillding!.externalPosition.latitude,
                    _nearestBuillding!.externalPosition.longitude);
                if (distanse > 80) {
                  add(const CloseToBuilding(null));
                }
              }
              for (var element in _buildings) {
                var distanse = Geolocator.distanceBetween(
                    _currentPosition.latitude,
                    _currentPosition.longitude,
                    element.externalPosition.latitude,
                    element.externalPosition.longitude);
                if (distanse < 80) {
                  add(CloseToBuilding(element));
                }
              }
            },
          );
        });
      }
      if (event is MapLoaded) {
        emit(MapState(_buildings, _route, MapStatus.loading, _currentPosition,
            _nearestBuillding, auditoryEndpointId));
        var result = await loadMap(NoParams());

        result.fold(
          (l) => _emitError(l, emit),
          (r) {
            _buildings = r;
            emit(MapState(_buildings, _route, MapStatus.success,
                _currentPosition, _nearestBuillding, auditoryEndpointId));
          },
        );
      }

      if (event is RouteCreated) {
        await _createRoute(event.to, emit);
      }
    });
  }

  Future<void> _createRouteToLesson(Lesson to, Emitter<MapState> emit) async {
    emit(MapState(_buildings, _route, MapStatus.loading, _currentPosition,
        _nearestBuillding, auditoryEndpointId));
    var route =
        await getRouteToLesson(GetRouteToLessonParams(to, _currentPosition));
    route.fold(
      (l) => _emitError(l, emit),
      (r) {
        _route = r.$1;
        _routeEndpoint = r.$2.id;
        emit(MapState(_buildings, _route, MapStatus.success, _currentPosition,
            _nearestBuillding, auditoryEndpointId));
      },
    );
  }

  Future<void> _createRoute(String to, Emitter<MapState> emit) async {
    emit(MapState(_buildings, _route, MapStatus.loading, _currentPosition,
        _nearestBuillding, auditoryEndpointId));
    var result = await getRoute(
      GetExternalRouteParams(
        from: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        toId: to,
      ),
    );

    result.fold(
      (l) => _emitError(l, emit),
      (r) {
        _route = r;
        _routeEndpoint = to;
        emit(MapState(_buildings, _route, MapStatus.success, _currentPosition,
            _nearestBuillding, auditoryEndpointId));
      },
    );
  }

  @override
  Future<void> close() async {
    geopositionRepository.dispose();
    await super.close();
  }

  void _emitError(Failure l, Emitter<MapState> emit) {
    if (l is UnknownFailure) {
      log(l.message);
      log(l.stackTrace);
    }
    if (l is ServerFailure) {
      log(l.message);
    }
    emit(MapState(_buildings, _route, MapStatus.failure, _currentPosition,
        _nearestBuillding, auditoryEndpointId));
  }
}
