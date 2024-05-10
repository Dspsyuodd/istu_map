import 'dart:math';

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
        body: Stack(
          children: [
            ImageMap(
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
                MarkerMapLayer(
                  markers: [
                    MapMarker(
                        point: const Offset(0.4, 0.4),
                        child: const Icon(Icons.mark_email_read)),
                  ],
                ),
              ],
              options: const ImageMapOptions(
                backgroundColor: Color.fromRGBO(73, 83, 131, 1),
                minScale: 0.8,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          mapController.move(
                              offset: Offset(mapController.offset.dx - 10,
                                  mapController.offset.dy));
                        },
                        child: const Text(
                          "Move left",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          mapController.move(
                              offset: Offset(mapController.offset.dx + 10,
                                  mapController.offset.dy));
                        },
                        child: const Text(
                          "Move right",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    IconButton(
                        onPressed: () {
                          mapController.rotate(
                            angle: mapController.rotation - pi / 8,
                            origin: mapController.offset + Offset(100, 100),
                          );
                        },
                        icon: const Icon(
                          Icons.rotate_left_outlined,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          mapController.rotate(
                            angle: mapController.rotation + pi / 8,
                            origin: mapController.offset + Offset(100, 100),
                          );
                        },
                        icon: const Icon(
                          Icons.rotate_right_outlined,
                          color: Colors.white,
                        )),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    IconButton(
                        onPressed: () {
                          mapController.move(zoom: mapController.zoom - 0.1);
                        },
                        icon: const Icon(
                          Icons.zoom_in,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          mapController.move(zoom: mapController.zoom + 0.1);
                        },
                        icon: const Icon(
                          Icons.zoom_out,
                          color: Colors.white,
                        )),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
