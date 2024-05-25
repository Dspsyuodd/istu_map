import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_map/image_map.dart';
import 'package:istu_map/features/authentication/authentication_injection_container.dart';
import 'package:istu_map/features/map/internal_map/presintation/bloc/building_map_bloc.dart';
import 'package:istu_map/features/map/shared/domain/entities/building.dart';

class BuildingMap extends StatelessWidget {
  const BuildingMap({Key? key, required this.building}) : super(key: key);
  final Building building;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BuildingMapBloc>()
        ..add(FloorOpened(building.id, building.floors.first.floorNumber,
            building.floors.first.floorId)),
      child: BlocBuilder<BuildingMapBloc, BuildingMapState>(
        builder: (context, state) {
          Image? image;
          if (state.floorImage != null) {
            image = Image.memory(state.floorImage!);
          }
          List<MapMarker>? markers = state.floor?.objects
              .map(
                (e) => MapMarker(
                  point: Offset(e.x, e.y),
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.black,
                  ),
                ),
              )
              .toList();
          return ImageMap(
            baseImage: image ?? Image.asset('assets/images/map.png'),
            markupElements: [
              MarkerMapLayer(
                markers: markers ?? [],
              ),
            ],
            options: const ImageMapOptions(),
          );
        },
      ),
    );
  }
}
