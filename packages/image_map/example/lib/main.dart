import 'package:image_map/image_map.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final mapController = ImageMapController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Image map example"),
        ),
        body: ImageMap(
          baseImage: Image.asset('assets/floor_image.jpg'),
          controller: mapController,
          markupElements: [
            PolylineMapLayer(
              polylines: [
                MapPolyline(
                  color: Colors.blue,
                  strokeWidth: 10,
                  points: [
                    const Offset(0.11, 0.2),
                    const Offset(0.11, 0.6),
                    const Offset(0.3, 0.6),
                    const Offset(0.3, 0.47),
                    const Offset(0.6, 0.47),
                    const Offset(0.6, 0.65),
                    const Offset(0.3, 0.65),
                    const Offset(0.3, 0.8),
                  ],
                ),
              ],
            ),
          ],
          options: ImageMapOptions(
            minScale: 0.8,
          ),
        ),
      ),
    );
  }
}
