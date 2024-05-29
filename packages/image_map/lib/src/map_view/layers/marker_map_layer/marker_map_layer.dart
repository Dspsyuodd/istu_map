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

  void _findOffsets() {
    _keys = List.generate(widget.markers.length, (_) => GlobalKey());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var offsets = <Offset>[];
      for (var key in _keys) {
        var renderObject = key.currentContext!.findRenderObject() as RenderBox;
        offsets.add(Offset(
          renderObject.size.width / 2,
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
          children: widget.markers
              .mapIndexed(
                (index, e) => Positioned(
                  left: e.point.dx * constraints.maxWidth -
                      (_offsetsByChildSize.length == widget.markers.length
                          ? _offsetsByChildSize[index].dx
                          : 0),
                  top: e.point.dy * constraints.maxHeight -
                      (_offsetsByChildSize.length == widget.markers.length
                          ? _offsetsByChildSize[index].dy
                          : 0),
                  child: Transform.rotate(
                    angle: -mapInfo.state.rotation,
                    origin: _offsetsByChildSize.length == widget.markers.length
                        ? Offset(0, _offsetsByChildSize[index].dy / 2)
                        : null,
                    child: Transform.scale(
                      origin:
                          _offsetsByChildSize.length == widget.markers.length
                              ? Offset(0, _offsetsByChildSize[index].dy / 2)
                              : null,
                      scale: (1 / mapInfo.state.scale),
                      child: Container(
                        key: _keys[index],
                        child: e.child,
                      ),
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
