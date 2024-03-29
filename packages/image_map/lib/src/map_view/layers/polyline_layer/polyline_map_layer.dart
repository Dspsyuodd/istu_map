import 'package:flutter/material.dart';
import 'package:image_map/image_map.dart';

import 'map_polyline.dart';

class PolylineMapLayer extends StatelessWidget {
  const PolylineMapLayer({
    Key? key,
    required this.polylines,
  }) : super(key: key);

  final List<MapPolyline> polylines;

  @override
  Widget build(BuildContext context) {
    final options = ImageMapInheritedWidget.of(context).options;

    return Container();
  }
}
