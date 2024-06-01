import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_map/image_map.dart';
import 'package:istu_map/features/app/ui/end_navigarion_drawer.dart';
import 'package:istu_map/features/authentication/authentication_injection_container.dart';
import 'package:istu_map/features/map/internal_map/presintation/bloc/building_map_bloc.dart';
import 'package:istu_map/features/map/internal_map/presintation/widgets/building_map_app_bar.dart';
import 'package:istu_map/features/map/internal_map/presintation/widgets/floor_select_button.dart';
import 'package:istu_map/features/map/shared/domain/entities/building.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';
import 'package:istu_map/features/user/presentation/widgets/shedule_drawer.dart';

class BuildingMap extends StatefulWidget {
  const BuildingMap({Key? key, required this.building}) : super(key: key);
  final Building building;

  @override
  State<BuildingMap> createState() => _BuildingMapState();
}

class _BuildingMapState extends State<BuildingMap> {
  int? initialIndex;

  @override
  void initState() {
    int? selectedLesson = BlocProvider.of<UserBloc>(context).state.mapOrNull(
      success: (value) {
        if (value.selectedLesson == null) return -1;
        return value.shedule.indexOf(value.selectedLesson!);
      },
    );
    if (selectedLesson != null && selectedLesson != -1) {
      initialIndex = selectedLesson;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildingMapAppBar(title: widget.building.title),
      body: BlocProvider<BuildingMapBloc>(
        create: (context2) {
          var bloc = sl<BuildingMapBloc>();
          bloc.add(FloorOpened(
            widget.building.id,
            widget.building.floors.first.floorNumber,
            widget.building.floors.first.floorId,
          ));

          return bloc;
        },
        child: MultiBlocListener(
          listeners: [
            BlocListener<BuildingMapBloc, BuildingMapState>(
              listener: (context, state) {
                if (state.status != BuildingMapStatus.initial) return;
                if (initialIndex != null) {
                  BlocProvider.of<BuildingMapBloc>(context).add(RouteCreated(
                    toId: BlocProvider.of<UserBloc>(context).state.whenOrNull(
                      success: (user, shedule, selectedLesson) {
                        return shedule[initialIndex!].audienceId;
                      },
                    )!,
                  ));
                }
              },
            ),
            BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (user, shedule, selectedLesson) {
                    if (selectedLesson != null) {}
                  },
                );
              },
            ),
          ],
          child: BlocBuilder<BuildingMapBloc, BuildingMapState>(
            builder: (context2, state) {
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
              return Stack(
                children: [
                  ImageMap(
                    baseImage: image ?? Image.asset('assets/images/map.png'),
                    markupElements: [
                      PolylineMapLayer(
                        polylines: [
                          if (state.route != null)
                            MapPolyline(
                              points: state.route!
                                  .floors[state.floor!.floorNumber - 1].route
                                  .map((e) => Offset(e.x, e.y))
                                  .toList(),
                            ),
                        ],
                      ),
                      MarkerMapLayer(
                        markers: markers ?? [],
                      ),
                    ],
                    options: ImageMapOptions(
                      backgroundColor: AppTheme.of(context).colorScheme.primary,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.building.floors
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloorSelectButton(
                                text: e.floorNumber.toString(),
                                onTap: () {
                                  if (state.floor != null &&
                                      state.floor!.floorNumber ==
                                          e.floorNumber) {
                                    return;
                                  }
                                  BlocProvider.of<BuildingMapBloc>(context2)
                                      .add(FloorOpened(widget.building.id,
                                          e.floorNumber, e.floorId));
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  if (state.status == BuildingMapStatus.loading)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  EndDrawer(
                    width: MediaQuery.of(context).size.width * 0.61,
                    child: ScheduleDrawer(
                      initialIndex: initialIndex,
                      onTap: (index, currentSelected) {
                        if (index == currentSelected) {
                          // BlocProvider.of<BuildingMapBloc>(context).add(Create);
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
