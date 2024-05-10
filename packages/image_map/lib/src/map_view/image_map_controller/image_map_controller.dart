import 'dart:ui';

import 'image_map_controller_impl.dart';

abstract interface class ImageMapController {
  factory ImageMapController() = ImageMapControllerImpl;

  double get zoom;
  double get rotation;
  Offset get offset;
  void move({double? zoom, Offset? offset});
  void rotate({double? angle, Offset? origin});
  void dispose();
}
