import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../image_map.dart';
import '../../core/offset_rotate_extension.dart';
import 'internal_map_controller/internal_map_controller.dart';

import 'image_map_inherited_widget.dart';

class ImageMapInteractiveViewer extends StatefulWidget {
  const ImageMapInteractiveViewer({
    Key? key,
    this.child,
    this.controller,
    required this.options,
  }) : super(key: key);

  final Widget? child;
  final InternalMapController? controller;
  final ImageMapOptions options;

  @override
  ImageMapInteractiveViewerState createState() =>
      ImageMapInteractiveViewerState();
}

class ImageMapInteractiveViewerState extends State<ImageMapInteractiveViewer> {
  var _offset = Offset.zero;

  var _zoom = 1.0;
  var _currentZoom = 1.0;

  var _rotationAngle = 0.0;
  var _currentRotation = 0.0;
  var _rotationStartDelta = 0.0;
  bool _rotationStarted = false;

  var _pivotPoint = Offset.zero;

  InteractiveViewerState get state => InteractiveViewerState(
        offset: _offset,
        rotation: _currentRotation + _rotationAngle,
        scale: _currentZoom * _zoom,
      );

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.mapState = this;
    }
  }

  void move({double? zoom, Offset? offset}) {
    setState(() {
      if (offset != null) {
        _offset = offset;
      }

      if (zoom != null) {
        _currentZoom = zoom;
        _zoom = 1.0;
      }
    });
  }

  void rotate({double? degree, Offset? origin}) {
    setState(() {
      if (degree != null) {
        _offset = _offset.rotate(degree,
            origin: origin ?? _pivotPoint);
        _currentRotation = degree;
        _rotationAngle = 0;
      }
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _offset += details.focalPointDelta;
      if (_currentZoom * details.scale < widget.options.maxScale &&
          _currentZoom * details.scale > widget.options.minScale) {
        _zoom = details.scale;
      }

      if (details.rotation.abs() > widget.options.rotationGap &&
          !_rotationStarted) {
        _rotationStartDelta = details.rotation;
        _rotationStarted = true;
      }
      _pivotPoint = details.localFocalPoint - _offset;
      if (_rotationStarted) {
        _rotationAngle = details.rotation - _rotationStartDelta;
      }
    });
  }

  void _onScaleEnd(ScaleEndDetails details) {
    _offset =
        _offset.rotate(_rotationAngle, origin: _pivotPoint * _zoom + _offset);
    _offset += _pivotPoint * (1 - _zoom);

    _currentZoom *= _zoom;
    _zoom = 1.0;

    _currentRotation += _rotationAngle;
    _rotationAngle = 0;
    _rotationStarted = false;
    _pivotPoint = Offset.zero;
  }

  Matrix4 _getTransformMatrix() => Matrix4.identity()
    ..translate(_offset.dx, _offset.dy)
    ..translate(_pivotPoint.dx, _pivotPoint.dy)
    ..scale(_zoom)
    ..rotateZ(_rotationAngle)
    ..translate(-_pivotPoint.dx, -_pivotPoint.dy)
    ..scale(_currentZoom)
    ..rotateZ(_currentRotation);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: _onScaleUpdate,
      onScaleEnd: _onScaleEnd,
      child: Stack(
        children: [
          Container(
            color: widget.options.backgroundColor ?? Colors.grey,
          ),
          Transform(
            transform: _getTransformMatrix(),
            child: ImageMapInheritedWidget(
              options: widget.options,
              state: InteractiveViewerState(
                offset: _offset,
                rotation: _currentRotation + _rotationAngle,
                scale: _currentZoom * _zoom,
              ),
              child: widget.child ?? Container(),
            ),
          ),
        ],
      ),
    );
  }
}

class InteractiveViewerState extends Equatable {
  final double rotation;
  final double scale;
  final Offset offset;

  const InteractiveViewerState(
      {required this.rotation, required this.scale, required this.offset});

  @override
  List<Object?> get props => [rotation, scale, offset];
}
