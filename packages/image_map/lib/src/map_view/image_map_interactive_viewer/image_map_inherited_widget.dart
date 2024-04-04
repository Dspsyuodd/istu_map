import 'package:flutter/material.dart';

import '../../../image_map.dart';
import 'image_map_interactive_viewer.dart';

class ImageMapInheritedWidget extends InheritedWidget {
  const ImageMapInheritedWidget({
    Key? key,
    required Widget child,
    required this.options,
    required this.state,
  }) : super(key: key, child: child);

  final ImageMapOptions options;
  final ImageMapInteractiveViewerState state;

  @override
  bool updateShouldNotify(covariant ImageMapInheritedWidget oldWidget) {
    return options != oldWidget.options;
  }

  static ImageMapInheritedWidget of(BuildContext context) {
    return _maybeOf(context)!;
  }

  static ImageMapInheritedWidget? _maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ImageMapInheritedWidget>();
  }
}
