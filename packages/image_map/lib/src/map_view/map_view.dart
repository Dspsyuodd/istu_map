import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_map/src/map_view/image_map_interactive_viewer/image_map_interactive_viewer.dart';
import 'package:image_map/src/map_view/image_map_controller/image_map_controller_impl.dart';

import 'image_map_interactive_viewer/internal_map_controller/internal_map_controller.dart';
import 'image_map_controller/image_map_controller.dart';

class ImageMap extends StatefulWidget {
  const ImageMap({
    Key? key,
    required this.baseImage,
    required this.markupElements,
    this.controller,
    required this.options,
  }) : super(key: key);

  final Image baseImage;
  final List<Widget> markupElements;
  final ImageMapController? controller;
  final ImageMapOptions options;

  @override
  State<ImageMap> createState() => _ImageMapState();
}

class _ImageMapState extends State<ImageMap> {
  late ImageMapControllerImpl _imageMapController;
  late final InternalMapController _internalMapController;

  @override
  void initState() {
    super.initState();

    _internalMapController = InternalMapController();
    _initializeAndLinkController();
  }

  void _initializeAndLinkController() {
    _imageMapController =
        (widget.controller ?? ImageMapController()) as ImageMapControllerImpl;
    _internalMapController.linkMapController(_imageMapController);
  }

  @override
  void dispose() {
    _imageMapController.dispose();
    _internalMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImageMapInteractiveViewer(
      controller: _internalMapController,
      options: widget.options,
      child: Stack(
        children: [
          widget.baseImage,
          ...widget.markupElements.map((e) => Positioned.fill(child: e)),
        ],
      ),
    );
  }
}

class ImageMapOptions {
  final Color? backgroundColor;
  final double rotationGap;
  final double maxScale;
  final double minScale;

  ImageMapOptions({
    this.backgroundColor,
    this.rotationGap = pi / 10,
    this.maxScale = 3.0,
    this.minScale = 0.5,
  });
}
