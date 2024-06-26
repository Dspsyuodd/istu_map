import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import 'package:istu_map/features/map/shared/presentation/widgets/object_marker.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';
import 'package:latlong2/latlong.dart';

import '../bloc/map_bloc.dart';
import 'close_to_building_bottom_sheet.dart';
import 'map_focus_button.dart';
import 'on_click_bottom_sheet.dart';
import 'scale_button.dart';

class IstuMapWidget extends StatefulWidget {
  const IstuMapWidget({Key? key}) : super(key: key);

  @override
  State<IstuMapWidget> createState() => _IstuMapWidgetState();
}

class _IstuMapWidgetState extends State<IstuMapWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  final mapController = MapController();
  bool isZoomIn = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn))
      ..addListener(() {
        mapController.move(mapController.camera.center,
            mapController.camera.zoom + (isZoomIn ? 0.2 : -0.2));
      });
    BlocProvider.of<MapBloc>(context).add(const MapLoaded());
    BlocProvider.of<MapBloc>(context).add(const InitGeolocation());
    super.initState();
  }

  void _zoomIn() {
    animationController.value = 0;
    isZoomIn = true;
    animationController.forward();
  }

  void _zoomOut() {
    animationController.value = 0;
    isZoomIn = false;
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocListener<MapBloc, MapState>(
          listener: (context, state) {
            if (state.status == MapStatus.initial) {
              mapController.move(state.currentPosition, 13);
            }
            if (state.status == MapStatus.success &&
                state.nearestBuillding != null) {
              if (state.nearestBuillding != null) {
                showBottomSheet(
                  elevation: 100,
                  context: context,
                  builder: (sheetContext) {
                    return BlocProvider.value(
                      value: BlocProvider.of<UserBloc>(sheetContext),
                      child: CloseToBuildingBottomSheet(
                          building: state.nearestBuillding!),
                    );
                  },
                );
              }
            }
          },
          child: FlutterMap(
            mapController: mapController,
            options: const MapOptions(
              initialCenter: LatLng(56.84781353176152, 53.21021903088401),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.istu_map',
              ),
              BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  if (state.route != null) {
                    return PolylineLayer(
                      polylines: [
                        Polyline(
                          points: state.route!.points,
                          color: AppTheme.of(context).colorScheme.primary,
                          strokeWidth: 6.0,
                          borderColor: Colors.black,
                          borderStrokeWidth: 6,
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
              BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  return MarkerLayer(
                    markers: state.buildings.map((e) {
                      var text = titleToMarkerText(e.title);
                      return Marker(
                        rotate: true,
                        point: e.externalPosition,
                        child: InkWell(
                          child: text != null
                              ? Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppTheme.of(context)
                                          .colorScheme
                                          .secondary),
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      text,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                )
                              : const ObjectMarker(
                                  icon: Icons.home,
                                ),
                          onTap: () {
                            showBottomSheet(
                              elevation: 100,
                              context: context,
                              builder: (sheetContext) {
                                return BlocProvider.value(
                                  value:
                                      BlocProvider.of<UserBloc>(sheetContext),
                                  child: OnClickBottomSheet(building: e),
                                );
                              },
                            );
                          },
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              CurrentLocationLayer(
                style: LocationMarkerStyle(
                  headingSectorColor:
                      AppTheme.of(context).colorScheme.secondary,
                  marker: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleButton(
                  icon: Icons.add,
                  onTap: _zoomIn,
                ),
                const SizedBox(
                  height: 170,
                ),
                ScaleButton(
                  icon: Icons.remove,
                  onTap: _zoomOut,
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 27, bottom: 38),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (state.route != null)
                      InkWell(
                        onTap: () {
                          BlocProvider.of<MapBloc>(context)
                              .add(const RouteRemoved());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.of(context).colorScheme.surface,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Icon(Icons.close),
                        ),
                      ),
                    const Gap(5),
                    MapFocusButton(
                      onTap: () {
                        var pos = BlocProvider.of<MapBloc>(context)
                            .state
                            .currentPosition;
                        mapController.move(pos, mapController.camera.zoom);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  String? titleToMarkerText(String title) {
    return switch (title) {
      "Первый корпус" => '1',
      "Второй корпус" => '2',
      "Третий корпус" => '3',
      "Четвертый корпус" => '4',
      "Пятый корпус" => '5',
      "Шестой корпус" => '6',
      "Седьмой корпус" => '7',
      "Восьмой корпус" => '8',
      "Девятой корпус" => '9',
      _ => null,
    };
  }
}
