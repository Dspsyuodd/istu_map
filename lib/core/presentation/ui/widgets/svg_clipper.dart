import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class SvgClipper extends CustomClipper<Path> {
  final String svgPathData;
  

  SvgClipper(this.svgPathData);

  @override
  Path getClip(Size size) {
    return parseSvgPathData(svgPathData);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
