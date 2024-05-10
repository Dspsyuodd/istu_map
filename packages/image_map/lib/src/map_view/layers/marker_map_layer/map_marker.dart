import 'package:flutter/material.dart';

class MapMarker {
  final Offset point;
  final Widget child;
  final bool rotate;

  MapMarker({
    required this.point,
    required this.child,
    this.rotate = false,
  });
}
