import 'dart:developer';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/floor.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/route_floor.dart';
import 'package:istu_map/features/map/internal_map/domain/usecases/create_route.dart';
import 'package:istu_map/features/map/internal_map/domain/usecases/load_floor.dart';

part 'building_map_event.dart';
part 'building_map_state.dart';

class BuildingMapBloc extends Bloc<BuildingMapEvent, BuildingMapState> {
  final CreateRoute createRoute;
  final LoadFloor loadFloor;
  Floor? _currentFloor;
  InternalRoute? _route;
  Uint8List? _currentFloorImage;
  String? _startId;
  String? _endId;

  BuildingMapBloc(this.createRoute, this.loadFloor)
      : super(const BuildingMapState.initial()) {
    on<BuildingMapEvent>((event, emit) async {
      log(event.runtimeType.toString());
      if (event is RouteCleared) {
        _startId = null;
        _endId = null;
        _route = null;
        emit(
          _getState(BuildingMapStatus.success),
        );
      }
      if (event is FloorOpened) {
        emit(
          _getState(BuildingMapStatus.loading),
        );
        var newFloor = await loadFloor(
          FloorLoadParams(
            buildingId: event.buildingId,
            floorId: event.floorId,
            floorNumber: event.floorNumber,
          ),
        );
        newFloor.fold(
          (l) => _emitError(l, emit),
          (r) {
            _currentFloorImage = r.$2;
            for (var waypoint in r.$1.objects) {
              if (waypoint.type == 7) {
                _startId = waypoint.id;
                break;
              }
            }
            var stateToEmit = _currentFloor == null
                ? BuildingMapStatus.initial
                : BuildingMapStatus.success;
            _currentFloor = r.$1;
            emit(
              _getState(stateToEmit),
            );
          },
        );
      }
      if (event is InternalRouteCreated) {
        emit(
          _getState(BuildingMapStatus.loading),
        );
        if (event.fromId != null) {
          _startId = event.fromId;
        }
        if (event.toId != null) {
          _endId = event.toId;
        }
        if (_startId == null || _endId == null) {
          emit(
            _getState(BuildingMapStatus.success),
          );
          return;
        }
        var route = await createRoute(CreateRouteParams(
          fromId: _startId!,
          toId: _endId!,
        ));

        route.fold(
          (l) => _emitError(l, emit),
          (r) {
            _route = r;
            emit(
              _getState(BuildingMapStatus.success),
            );
          },
        );
      }
    });
  }

  BuildingMapState _getState(BuildingMapStatus status) => BuildingMapState(
        status,
        _currentFloor,
        _currentFloorImage,
        _route,
        _startId,
        _endId,
      );

  void _emitError(Failure l, Emitter<BuildingMapState> emit) {
    if (l is UnknownFailure) {
      log(l.message);
      log(l.stackTrace);
    }
    if (l is ServerFailure) {
      log(l.message);
    }
    emit(
      BuildingMapState(
        BuildingMapStatus.success,
        _currentFloor,
        _currentFloorImage,
        _route,
        _startId,
        _endId,
      ),
    );
  }
}
