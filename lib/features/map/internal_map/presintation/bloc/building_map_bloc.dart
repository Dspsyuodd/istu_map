import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/floor.dart';
import 'package:istu_map/features/map/internal_map/domain/usecases/create_route.dart';
import 'package:istu_map/features/map/internal_map/domain/usecases/load_floor.dart';

part 'building_map_event.dart';
part 'building_map_state.dart';

class BuildingMapBloc extends Bloc<BuildingMapEvent, BuildingMapState> {
  final CreateRoute createRoute;
  final LoadFloor loadFloor;
  Floor? _currentFloor;
  Uint8List? _currentFloorImage;

  BuildingMapBloc(this.createRoute, this.loadFloor)
      : super(const BuildingMapState.initial()) {
    on<BuildingMapEvent>((event, emit) async {
      if (event is FloorOpened) {
        emit(
          BuildingMapState(
            BuildingMapStatus.loading,
            _currentFloor,
            _currentFloorImage,
          ),
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
            _currentFloor = r.$1;
            _currentFloorImage = r.$2;
            emit(
              BuildingMapState(
                BuildingMapStatus.success,
                _currentFloor,
                _currentFloorImage,
              ),
            );
          },
        );
      }
    });
  }

  void _emitError(Failure l, Emitter<BuildingMapState> emit) {
    if (l is UnknownFailure) {
      log(l.message);
      log(l.stackTrace);
    }
    if (l is ServerFailure) {
      log(l.message);
    }
  }
}
