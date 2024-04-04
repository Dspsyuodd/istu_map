import 'package:flutter/material.dart';

class MapPolyline {
  MapPolyline({
    this.points = const [],
    this.color = Colors.black,
    this.arrowsColor = Colors.white,
    this.strokeWidth = 5,
  });

  final List<Offset> points;
  final Color color;
  final Color arrowsColor;
  final double strokeWidth;
}
