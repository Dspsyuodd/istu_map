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
  var _currentPosition = const LatLng(0.0, 0.0);
  Building? _nearestBuillding;

  MapBloc(this.getRoute, this.loadMap, this.geopositionRepository)
      : super(const MapState.initial()) {
    on<MapEvent>((event, emit) async {
      log(event.runtimeType.toString());

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
              _currentPosition = r;
              if (_nearestBuillding != null) {
                var distanse = Geolocator.distanceBetween(
                    _currentPosition.latitude,
                    _currentPosition.longitude,
                    _nearestBuillding!.position.latitude,
                    _nearestBuillding!.position.longitude);
                if (distanse > 30) {
                  add(const CloseToBuilding(null));
                }
              }
              for (var element in _buildings) {
                var distanse = Geolocator.distanceBetween(
                    _currentPosition.latitude,
                    _currentPosition.longitude,
                    element.position.latitude,
                    element.position.longitude);
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
        emit(MapState(_buildings, _route, MapStatus.loading, _currentPosition,
            _nearestBuillding));
        var position = await Geolocator.getCurrentPosition();
        var result = await getRoute(GetExternalRouteParams(
            from: LatLng(position.latitude, position.longitude), to: event.to));

        result.fold(
          (l) => _emitError(l, emit),
          (r) {
            _route = r;
            emit(MapState(_buildings, _route, MapStatus.success,
                _currentPosition, _nearestBuillding));
          },
        );
      }
    });
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
