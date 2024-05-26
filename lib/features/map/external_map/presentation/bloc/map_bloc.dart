import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
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

  List<Building> _buildings = [];
  ExternalRoute? _route;
  Building? _routeEndpoint;
  var _currentPosition = const LatLng(0.0, 0.0);
  Building? _nearestBuillding;

  MapBloc(this.getRoute, this.loadMap, this.geopositionRepository)
      : super(const MapState.initial()) {
    on<MapEvent>((event, emit) async {
      log(event.runtimeType.toString());

      if (event is PositionChanged && _route != null) {
        await _createRoute(_routeEndpoint!, emit);
      }

      if (event is CloseToBuilding) {
        _nearestBuillding = event.building;
        emit(MapState(_buildings, _route, MapStatus.success, _currentPosition,
            event.building));
      }

      if (event is InitGeolocation) {
        var position = await geopositionRepository.getCurrentPosition();
        position.fold(
          (l) => _emitError(l, emit),
          (r) {
            emit(MapState(
                _buildings, _route, MapStatus.initial, r, _nearestBuillding));
          },
        );

        geopositionRepository.addListener((position) {
          position.fold(
            (l) => null,
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
                if (distanse > 30) {
                  add(const CloseToBuilding(null));
                }
              }
              for (var element in _buildings) {
                var distanse = Geolocator.distanceBetween(
                    _currentPosition.latitude,
                    _currentPosition.longitude,
                    element.externalPosition.latitude,
                    element.externalPosition.longitude);
                if (distanse < 30) {
                  add(CloseToBuilding(element));
                }
              }
            },
          );
        });
      }
      if (event is MapLoaded) {
        emit(MapState(_buildings, _route, MapStatus.loading, _currentPosition,
            _nearestBuillding));
        var result = await loadMap(NoParams());

        result.fold(
          (l) => _emitError(l, emit),
          (r) {
            _buildings = r;
            emit(MapState(_buildings, _route, MapStatus.success,
                _currentPosition, _nearestBuillding));
          },
        );
      }

      if (event is RouteCreated) {
        await _createRoute(event.to, emit);
      }
    });
  }

  Future<void> _createRoute(Building to, Emitter<MapState> emit) async {
    emit(MapState(_buildings, _route, MapStatus.loading, _currentPosition,
        _nearestBuillding));
    var result = await getRoute(
      GetExternalRouteParams(
        from: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        to: to,
      ),
    );

    result.fold(
      (l) => _emitError(l, emit),
      (r) {
        _route = r;
        _routeEndpoint = to;
        emit(MapState(_buildings, _route, MapStatus.success, _currentPosition,
            _nearestBuillding));
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
        _nearestBuillding));
  }
}
