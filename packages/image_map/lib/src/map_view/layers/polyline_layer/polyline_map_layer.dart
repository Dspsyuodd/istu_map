import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_map/image_map.dart';
import 'package:image_map/src/core/offset_rotate_extension.dart';

import '../../image_map_interactive_viewer/image_map_inherited_widget.dart';
import '../../image_map_interactive_viewer/image_map_interactive_viewer.dart';

class PolylineMapLayer extends StatefulWidget {
  const PolylineMapLayer({
    Key? key,
    required this.polylines,
  }) : super(key: key);

  final List<MapPolyline> polylines;

  @override
  State<PolylineMapLayer> createState() => _PolylineMapLayerState();
}

class _PolylineMapLayerState extends State<PolylineMapLayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )
      ..addListener(() {
        setState(() {});
      })
      ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapInfo = ImageMapInheritedWidget.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        var size = Size(constraints.maxWidth, constraints.maxHeight);
        return Stack(
          children: widget.polylines
              .map(
                (e) => CustomPaint(
                  size: size,
                  painter: MapPolylinePainter(
                    animation: _animationController.value,
                    polyline: e,
                    options: mapInfo.options,
                    state: mapInfo.state,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class MapPolylinePainter extends CustomPainter {
  final MapPolyline polyline;
  final ImageMapOptions options;
  final ImageMapInteractiveViewerState state;
  final double animation;

  MapPolylinePainter({
    super.repaint,
    required this.polyline,
    required this.options,
    required this.state,
    this.animation = 0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    const arrowOffset = 10.0;
    final paint = Paint();
    paint
      ..strokeWidth = (1 / state.scale) * polyline.strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < polyline.points.length - 1; i++) {
      final firstPoint = Offset(polyline.points[i].dx * size.width,
          polyline.points[i].dy * size.height);
      final secondPoint = Offset(polyline.points[i + 1].dx * size.width,
          polyline.points[i + 1].dy * size.height);
      // var aliegment = _getLineGradiendAliegment(firstPoint, secondPoint);
      canvas.drawLine(
          firstPoint,
          secondPoint,
          paint
            ..color = polyline.color
            ..strokeWidth = (1 / state.scale) * polyline.strokeWidth
          // ..shader = LinearGradient(
          //   begin: aliegment.$1,
          //   end: aliegment.$2,
          //   colors: [polyline.color, Colors.white],
          //   stops: [0.8, 1.0],
          //   tileMode: TileMode.mirror,
          // ).createShader(const Rect.fromLTWH(0, 0, 20, 20)),
          );
      paint
        ..color = polyline.arrowsColor
        ..strokeWidth = (1 / state.scale) * 2;
      final lenth = _distanse(firstPoint, secondPoint);
      for (int i = 0; i < lenth / arrowOffset - 1; i++) {
        var direction = _getDirection(firstPoint, secondPoint);
        var point =
            firstPoint + direction * ((i.toDouble() + animation) * arrowOffset);

        canvas.drawLine(point - direction.rotate(pi / 4) * (1 / state.scale) * 5, point, paint);
        canvas.drawLine(point + direction.rotate(pi / 4 * 3) * (1 / state.scale) * 5, point, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Offset _getDirection(Offset start, Offset end) {
    var dx = end.dx - start.dx;
    var dy = end.dy - start.dy;
    final lenth = sqrt(dx * dx + dy * dy);
    dx /= lenth;
    dy /= lenth;
    return Offset(dx, dy);
  }

  (Alignment, Alignment) _getLineGradiendAliegment(Offset start, Offset end) {
    final direction = _getDirection(start, end);
    final centerX = (start.dx + end.dx) / 2;
    final centerY = (start.dy + end.dy) / 2;
    return (
      Alignment(-centerX, -centerY),
      Alignment(direction.dx - centerX, direction.dy - centerY),
    );
  }
}

double _distanse(Offset a, Offset b) {
  return sqrt((a.dx - b.dx) * (a.dx - b.dx) + (a.dy - b.dy) * (a.dy - b.dy));
}
