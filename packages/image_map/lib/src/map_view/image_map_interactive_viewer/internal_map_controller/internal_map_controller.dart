import 'package:image_map/src/map_view/image_map_controller/image_map_controller_impl.dart';

class InternalMapController {
  InternalMapController();
  late ImageMapControllerImpl _imageMapControllerImpl;

  void linkMapController(ImageMapControllerImpl imageMapController) {
    _imageMapControllerImpl = imageMapController;
    _imageMapControllerImpl.internalMapController = this;
  }
  

  void dispose() {}
}
