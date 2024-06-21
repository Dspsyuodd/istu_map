import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_map/image_map.dart';
import 'package:istu_map/config/enums/object_type.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import 'package:istu_map/features/app/ui/end_navigarion_drawer.dart';
import 'package:istu_map/features/authentication/authentication_injection_container.dart';
import 'package:istu_map/features/map/external_map/presentation/bloc/map_bloc.dart';
import 'package:istu_map/features/map/internal_map/presintation/bloc/building_map_bloc.dart';
import 'package:istu_map/features/map/internal_map/presintation/widgets/floor_select_button.dart';
import 'package:istu_map/features/map/internal_map/presintation/widgets/object_bottom_sheet.dart';
import 'package:istu_map/features/map/shared/domain/entities/building.dart';
import 'package:istu_map/features/map/shared/presentation/widgets/object_marker.dart';
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
  String? initiaId;

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
    initiaId = BlocProvider.of<MapBloc>(context).state.auditoryEndpointId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuildingMapBloc>(
      create: (context2) {
        var bloc = sl<BuildingMapBloc>();
        bloc.add(FloorOpened(
          widget.building.id,
          widget.building.floors.first.floorNumber,
          widget.building.floors.first.floorId,
        ));

        return bloc;
      },
      child: Scaffold(
        floatingActionButton: BlocBuilder<BuildingMapBloc, BuildingMapState>(
          builder: (context, state) {
            return Visibility(
              visible: state.route != null,
              child: FloatingActionButton(
                backgroundColor: AppTheme.of(context).colorScheme.surface,
                child: Icon(
                  Icons.close,
                  color: AppTheme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  BlocProvider.of<BuildingMapBloc>(context).add(
                    const RouteCleared(),
                  );
                },
              ),
            );
          },
        ),
        appBar: AppBar(
          elevation: 10,
          shadowColor: Colors.black,
          backgroundColor: AppTheme.of(context).colorScheme.surface,
          title: Text(
            widget.building.title,
            style: AppTheme.of(context).textTheme.displayLarge,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppTheme.of(context).iconTheme.color,
              size: 15,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<BuildingMapBloc, BuildingMapState>(
              listener: (context, state) {
                if (state.status != BuildingMapStatus.initial) return;
                if (initialIndex != null) {
                  BlocProvider.of<BuildingMapBloc>(context)
                      .add(InternalRouteCreated(
                    toId: BlocProvider.of<UserBloc>(context).state.whenOrNull(
                      success: (user, shedule, selectedLesson) {
                        return shedule[initialIndex!].audienceId;
                      },
                    )!,
                  ));
                }
                if (initiaId != null) {
                  BlocProvider.of<BuildingMapBloc>(context)
                      .add(InternalRouteCreated(
                    toId: initiaId!,
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
            builder: (blocBuilderContext, state) {
              Image? image;
              if (state.floorImage != null) {
                image = Image.memory(state.floorImage!);
              }
              List<MapMarker>? markers = state.floor?.objects
                  .where((e) => e.type != ObjectType.node.index)
                  .map(
                    (e) => MapMarker(
                      point: Offset(e.x, e.y),
                      child: GestureDetector(
                        onTap: () {
                          showBottomSheet(
                            elevation: 100,
                            context: blocBuilderContext,
                            builder: (sheetContext) {
                              return BlocProvider.value(
                                value: BlocProvider.of<UserBloc>(
                                    blocBuilderContext),
                                child: BlocProvider.value(
                                  value: BlocProvider.of<BuildingMapBloc>(
                                      blocBuilderContext),
                                  child: ObjectBottomSheet(
                                    title: e.title,
                                    id: e.id,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: ObjectMarker(
                          isSelected:
                              e.id == state.endId || e.id == state.startId,
                          icon: ObjectType.values[e.type].iconData,
                          title: switch (ObjectType.values[e.type]) {
                            ObjectType.auditorium ||
                            ObjectType.cabinet =>
                              e.title,
                            _ => null,
                          },
                        ),
                      ),
                    ),
                  )
                  .toList();
              MapPolyline? mapPolyline;
              if (state.route != null &&
                  state.floor!.floorNumber - 1 < state.route!.floors.length) {
                mapPolyline = MapPolyline(
                  color: AppTheme.of(context).colorScheme.primary,
                  strokeWidth: 10,
                  points: state
                      .route!.floors[state.floor!.floorNumber - 1].route
                      .map((e) => Offset(e.x, e.y))
                      .toList(),
                );
              }
              return Stack(
                children: [
                  ImageMap(
                    baseImage: image ??
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                    markupElements: [
                      if (state.route != null)
                        PolylineMapLayer(
                          polylineMaxWidth: 2.5,
                          polylines: [
                            if (mapPolyline != null) mapPolyline,
                          ],
                        ),
                      MarkerMapLayer(
                        markersMaxScale: 0.3,
                        markers: markers ?? [],
                      ),
                    ],
                    options: ImageMapOptions(
                      maxScale: 8,
                      minScale: 0.7,
                      backgroundColor: AppTheme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.8),
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
                                isSelected: state.floor != null &&
                                    state.floor!.floorNumber == e.floorNumber,
                                text: e.floorNumber.toString(),
                                onTap: () {
                                  if (state.floor != null &&
                                      state.floor!.floorNumber ==
                                          e.floorNumber) {
                                    return;
                                  }
                                  BlocProvider.of<BuildingMapBloc>(
                                          blocBuilderContext)
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
