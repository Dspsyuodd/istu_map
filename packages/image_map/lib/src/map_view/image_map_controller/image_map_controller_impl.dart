import 'dart:ui';

import '../image_map_interactive_viewer/internal_map_controller/internal_map_controller.dart';

import 'image_map_controller.dart';

class ImageMapControllerImpl implements ImageMapController {
  ImageMapControllerImpl();
  late InternalMapController _internalMapController;

  set internalMapController(InternalMapController internalMapController) {
    _internalMapController = internalMapController;
  }

  @override
  void move({double? zoom, Offset? offset}) {
    _internalMapController.move(zoom: zoom, offset: offset);
  }

  @override
  void rotate({double? angle, Offset? origin}) {
    _internalMapController.rotate(degree: angle, origin: origin);
  }

  @override
  void dispose() {
    _internalMapController.dispose();
  }

  @override
  Offset get offset => _internalMapController.offset;

  @override
  double get rotation => _internalMapController.rotation;

  @override
  double get zoom => _internalMapController.scale;
}
