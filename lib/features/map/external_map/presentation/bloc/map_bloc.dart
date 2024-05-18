import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/usecases/usecase.dart';
import 'package:istu_map/features/map/external_map/domain/entities/exteral_route.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/get_route.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/load_map.dart';
import 'package:istu_map/features/map/shared/domain/entities/building.dart';
import 'package:latlong2/latlong.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final GetExternalRoute getRoute;
  final LoadMap loadMap;

  List<Building> _buildings = [];
  ExternalRoute? _route;

  MapBloc(this.getRoute, this.loadMap) : super(MapInitial()) {
    on<MapEvent>((event, emit) async {
      log(event.runtimeType.toString());
      if (event is MapLoaded) {
        emit(MapLoadInProgress());
        var result = await loadMap(NoParams());

        result.fold(
          (l) => _emitError(l, emit),
          (r) {
            _buildings = r;
            emit(MapLoadSuccess(_buildings, _route));
          },
        );
      }

      if (event is RouteCreated) {
        emit(MapLoadInProgress());
        var position = await Geolocator.getCurrentPosition();
        var result = await getRoute(GetExternalRouteParams(
            from: LatLng(position.latitude, position.longitude), to: event.to));

        result.fold(
          (l) => _emitError(l, emit),
          (r) {
            _route = r;
            emit(MapLoadSuccess(_buildings, _route));
          },
        );
      }
    });
  }

  void _emitError(Failure l, Emitter<MapState> emit) {
    if (l is UnknownFailure) {
      log(l.message);
      log(l.stackTrace);
    }
    if (l  is ServerFailure) {
      log(l.message);
    }
    emit(MapLoadFailure());
  }
}
