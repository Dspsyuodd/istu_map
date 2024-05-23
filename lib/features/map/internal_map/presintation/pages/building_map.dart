import 'package:flutter/material.dart';
import 'package:image_map/image_map.dart';

class BuildingMap extends StatelessWidget {
  const BuildingMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageMap(
      baseImage: Image.asset('assets/images/map.png'),
      markupElements: [],
      options: const ImageMapOptions(),
    );
  }
}
