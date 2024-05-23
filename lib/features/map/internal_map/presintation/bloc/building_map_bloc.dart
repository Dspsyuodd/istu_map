import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'building_map_event.dart';
part 'building_map_state.dart';

class BuildingMapBloc extends Bloc<BuildingMapEvent, BuildingMapState> {
  BuildingMapBloc() : super(BuildingMapInitial()) {
    on<BuildingMapEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
