import 'package:flutter/material.dart';
import 'map_marker.dart';

import '../../image_map_interactive_viewer/image_map_inherited_widget.dart';

class MarkerMapLayer extends StatelessWidget {
  const MarkerMapLayer({Key? key, required this.markers}) : super(key: key);

  final List<MapMarker> markers;

  @override
  Widget build(BuildContext context) {
    final mapInfo = ImageMapInheritedWidget.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: markers
              .map(
                (e) => Positioned(
                  left: e.point.dx * constraints.maxWidth,
                  top: e.point.dy * constraints.maxHeight,
                  child: Transform.rotate(
                    angle: -mapInfo.state.rotation,
                    child: Transform.scale(
                      scale: (1 / mapInfo.state.scale),
                      child: e.child,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
