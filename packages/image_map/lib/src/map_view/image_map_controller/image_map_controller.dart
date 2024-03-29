import 'dart:ui';

import 'image_map_controller_impl.dart';

abstract interface class ImageMapController {
  factory ImageMapController() = ImageMapControllerImpl;

  void move({required double zoom, required Offset offset});
  void rotate({required double degree});
  void dispose();
}
