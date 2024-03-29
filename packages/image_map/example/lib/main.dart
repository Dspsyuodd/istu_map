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
                MapPolyline(),
              ],
            ),
          ],
          options: ImageMapOptions(),
        ),
      ),
    );
  }
}
