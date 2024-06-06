import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../../core/presentation/ui/widgets/svg_clipper.dart';

import '../../../core/presentation/ui/widgets/clip_shadow_path.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({Key? key, this.onStateChanged, this.child, this.width = 300})
      : super(key: key);
  final void Function(bool isOpen)? onStateChanged;
  final Widget? child;
  final double width;

  @override
  EndDrawerState createState() => EndDrawerState();
}

class EndDrawerState extends State<EndDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..addStatusListener((status) {
        if (widget.onStateChanged != null) {
          widget.onStateChanged!(status == AnimationStatus.completed ||
              status == AnimationStatus.forward);
        }
      });
    animation = controller.drive<double>(CurveTween(curve: Curves.easeInOut));
    super.initState();
  }

  void _open() {
    useAnimation = true;
    controller.forward();
  }

  void _close() {
    useAnimation = true;
    controller.reverse();
  }

  void _toggle() {
    controller.isDismissed ? _open() : _close();
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (controller.isDismissed || controller.isCompleted) {
      return;
    }

    const minFlingVelocity = 100.0;
    final dragVelocity = details.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= minFlingVelocity) {
      final visualVelocityInPx = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      useAnimation = true;
      controller.fling(velocity: -visualVelocityInPx);
    } else if (controller.value < 0.5) {
      _close();
    } else {
      _open();
    }
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    useAnimation = false;
    controller.value -= details.delta.dx / widget.width;
  }

  var useAnimation = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final double offset = useAnimation ? animation.value : controller.value;
        final openButtonOffset = offset * widget.width - 1;
        final drawerOffset = offset * widget.width - widget.width;

        return Stack(
          alignment: Alignment.centerRight,
          children: [
            IgnorePointer(
              ignoring: !controller.isCompleted,
              child: GestureDetector(
                onTap: () {
                  if (controller.isCompleted) {
                    _close();
                  }
                },
                child: AnimatedOpacity(
                  opacity: (controller.status == AnimationStatus.completed ||
                          controller.status == AnimationStatus.forward)
                      ? 0.5
                      : 0,
                  duration: const Duration(milliseconds: 150),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              right: openButtonOffset,
              child: GestureDetector(
                onTap: _toggle,
                onHorizontalDragEnd: _onHorizontalDragEnd,
                onHorizontalDragUpdate: _onHorizontalDragUpdate,
                child: ClipShadowPath(
                  clipper: SvgClipper(
                      'M1 51.9184C1 91.9388 48 69.2245 48 106V0C48 34.1796 1 11.898 1 51.9184Z'),
                  shadow: Shadow(
                    color: Colors.black,
                    offset: Offset(controller.isCompleted ? -1 : 0, 0),
                    blurRadius: controller.isCompleted ? 10 : 0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        if (controller.isCompleted)
                          const BoxShadow(
                            color: Colors.black,
                            offset: Offset(-1, 0),
                            blurRadius: 10,
                          ),
                      ],
                      color: AppTheme.of(context).colorScheme.surface,
                    ),
                    height: 106,
                    width: 48,
                    child: Center(
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: animation,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: drawerOffset,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.61,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  boxShadow: [
                    if (controller.isCompleted)
                      const BoxShadow(
                          color: Colors.black,
                          offset: Offset(-1, 0),
                          blurRadius: 10),
                  ],
                  color: AppTheme.of(context).colorScheme.surface,
                ),
                child: widget.child,
              ),
            ),
          ],
        );
      },
    );
  }
}
