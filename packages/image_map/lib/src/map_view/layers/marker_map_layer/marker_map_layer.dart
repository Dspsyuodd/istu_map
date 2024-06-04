import 'package:flutter/material.dart';
import 'map_marker.dart';
import 'package:collection/collection.dart';

import '../../image_map_interactive_viewer/image_map_inherited_widget.dart';

class MarkerMapLayer extends StatefulWidget {
  const MarkerMapLayer({Key? key, required this.markers}) : super(key: key);

  final List<MapMarker> markers;

  @override
  State<MarkerMapLayer> createState() => _MarkerMapLayerState();
}

class _MarkerMapLayerState extends State<MarkerMapLayer> {
  var _keys = <GlobalKey>[];
  var _offsetsByChildSize = <Offset>[];

  @override
  void didUpdateWidget(covariant MarkerMapLayer oldWidget) {
    if (oldWidget.markers != widget.markers) {
      _findOffsets();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _findOffsets();
    super.initState();
  }

  void _findOffsets() {
    _keys = List.generate(widget.markers.length, (_) => GlobalKey());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var offsets = <Offset>[];
      for (var key in _keys) {
        var renderObject = key.currentContext!.findRenderObject() as RenderBox;
        offsets.add(Offset(
          renderObject.size.width,
          renderObject.size.height,
        ));
      }
      setState(() {
        _offsetsByChildSize = offsets;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mapInfo = ImageMapInheritedWidget.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: widget.markers.mapIndexed((index, e) {
            var leftSizeOffset = 0.0;
            var topSizeOffset = 0.0;
            Offset? origin;
            var markersAliegment =
                mapInfo.options.markersAlign ?? const Alignment(0, 0);
            if (_offsetsByChildSize.length == widget.markers.length) {
              leftSizeOffset = _offsetsByChildSize[index].dx *
                  (0.5 + markersAliegment.x / 2);
              topSizeOffset = _offsetsByChildSize[index].dy *
                  (0.5 + markersAliegment.y / 2);
              origin = Offset(
                  _offsetsByChildSize[index].dx * markersAliegment.x / 2,
                  _offsetsByChildSize[index].dy * markersAliegment.y / 2);
            }
            return Positioned(
              left: e.point.dx * constraints.maxWidth - leftSizeOffset,
              top: e.point.dy * constraints.maxHeight - topSizeOffset,
              child: Transform.rotate(
                angle: -mapInfo.state.rotation,
                origin: origin,
                child: Transform.scale(
                  origin: origin,
                  scale: (1 / mapInfo.state.scale),
                  child: Container(
                    key: _keys[index],
                    child: e.child,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
