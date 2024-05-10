import 'dart:ui';

import '../../image_map_controller/image_map_controller_impl.dart';
import '../image_map_interactive_viewer.dart';

class InternalMapController {
  InternalMapController();
  late ImageMapControllerImpl _imageMapControllerImpl;

  ImageMapInteractiveViewerState? mapState;

  get offset => mapState!.state.offset;

  get scale => mapState!.state.scale;

  get rotation => mapState!.state.rotation;

  void linkMapController(ImageMapControllerImpl imageMapController) {
    _imageMapControllerImpl = imageMapController;
    _imageMapControllerImpl.internalMapController = this;
  }

  void move({double? zoom, Offset? offset}) {
    mapState!.move(zoom: zoom, offset: offset);
  }

  void rotate({double? degree, Offset? origin}) {
    mapState!.rotate(degree: degree, origin: origin);
  }

  void dispose() {}
}
