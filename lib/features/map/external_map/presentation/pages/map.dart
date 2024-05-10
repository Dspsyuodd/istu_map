import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import '../widgets/map_focus_button.dart';
import '../widgets/scale_button.dart';
import 'package:latlong2/latlong.dart';

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
          onTap: () {},
        ),
      ],
    );
  }
}
