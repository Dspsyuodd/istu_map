import 'dart:ui';

import 'package:image_map/src/map_view/image_map_interactive_viewer/internal_map_controller/internal_map_controller.dart';

import 'image_map_controller.dart';

class ImageMapControllerImpl implements ImageMapController {
  ImageMapControllerImpl();
  late InternalMapController _internalMapController;

  set internalMapController(InternalMapController internalMapController) {
    _internalMapController = internalMapController;
  }

  @override
  void move({required double zoom, required Offset offset}) {
    // TODO: implement move
  }

  @override
  void rotate({required double degree}) {
    // TODO: implement rotate
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
