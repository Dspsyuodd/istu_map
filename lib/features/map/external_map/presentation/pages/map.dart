import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:istu_map/features/map/external_map/presentation/bloc/map_bloc.dart';
import '../widgets/map_focus_button.dart';
import '../widgets/scale_button.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        FlutterMap(
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
                if (state.status == MapStatus.success && state.route != null) {
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
                if (state.status == MapStatus.success || state.status == MapStatus.loading) {
                  return MarkerLayer(
                    markers: state.buildings
                        .map(
                          (e) => Marker(
                            rotate: true,
                            point: e.position,
                            child: InkWell(
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              onTap: () {
                                showBottomSheet(
                                  elevation: 100,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.of(context)
                                                    .colorScheme
                                                    .brightness ==
                                                Brightness.dark
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 7,
                                          ),
                                        ],
                                      ),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    e.title,
                                                    style: AppTheme.of(context)
                                                        .textTheme
                                                        .displayLarge,
                                                  ),
                                                  IconButton(
                                                    color: Colors.grey,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                      Icons.close_rounded,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton.icon(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppTheme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                    foregroundColor: AppTheme
                                                                    .of(context)
                                                                .colorScheme
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.black
                                                        : Colors.white,
                                                  ),
                                                  onPressed: () {},
                                                  icon: const Icon(Icons.chat),
                                                  label:
                                                      const Text("Комментарии"),
                                                ),
                                                ElevatedButton.icon(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppTheme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                    foregroundColor: AppTheme
                                                                    .of(context)
                                                                .colorScheme
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.black
                                                        : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    BlocProvider.of<MapBloc>(
                                                            context)
                                                        .add(
                                                      RouteCreated(to: e),
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(Icons.route),
                                                  label: const Text("Маршрут"),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
                return Container();
              },
            ),
            CurrentLocationLayer(
              style: LocationMarkerStyle(
                headingSectorColor: AppTheme.of(context).colorScheme.secondary,
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
        MapFocusButton(
          onTap: () {
            mapController.move(
                mapController.camera.center, mapController.camera.zoom);
          },
        ),
      ],
    );
  }
}
