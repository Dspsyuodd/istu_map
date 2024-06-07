import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import 'package:istu_map/features/authentication/authentication_injection_container.dart';
import 'package:istu_map/features/search/presentation/cubit/search_cubit.dart';

class BottomSearchDrawer extends StatefulWidget {
  const BottomSearchDrawer(
      {Key? key, required this.controller, this.onStateChanged, this.child})
      : super(key: key);
  final BottomSearchDrawerController controller;
  final void Function(bool isOpen)? onStateChanged;
  final Widget? child;

  @override
  State<BottomSearchDrawer> createState() => _BottomSearchDrawerState();
}

class _BottomSearchDrawerState extends State<BottomSearchDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.value == BottomSearchControllerState.open) {
        _open();
        return;
      }
      _close();
    });
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.forward) {
        widget.controller.value = BottomSearchControllerState.open;
      }
      if (status == AnimationStatus.dismissed ||
          status == AnimationStatus.reverse) {
        widget.controller.value = BottomSearchControllerState.close;
      }
      if (widget.onStateChanged != null) {
        widget.onStateChanged!(status == AnimationStatus.completed ||
            status == AnimationStatus.forward);
      }
    });

    animation = controller.drive<double>(CurveTween(curve: Curves.easeInOut));
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

  void _onVerticalDragEnd(DragEndDetails details) {
    const minFlingVelocity = 100.0;
    final dragVelocity = details.velocity.pixelsPerSecond.dy.abs();

    if (dragVelocity >= minFlingVelocity) {
      final visualVelocityInPx = details.velocity.pixelsPerSecond.dy /
          MediaQuery.of(context).size.width;
      useAnimation = true;
      controller.fling(velocity: -visualVelocityInPx);
    } else if (controller.value < 0.5) {
      _close();
    } else {
      _open();
    }
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    useAnimation = false;
    controller.value -= details.delta.dy / (MediaQuery.of(context).size.height);
  }

  var useAnimation = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height - 33;
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onVerticalDragUpdate: _onVerticalDragUpdate,
          onVerticalDragEnd: _onVerticalDragEnd,
          child: Stack(
            fit: StackFit.expand,
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
                top: (1 - (useAnimation ? animation.value : controller.value)) *
                    size.height,
                width: size.width,
                height: height + 33,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 33),
                  child: Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36)),
                    ),
                    child: BlocProvider(
                      create: (context) => sl<SearchCubit>(),
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomSearchDrawerController
    extends ValueNotifier<BottomSearchControllerState> {
  BottomSearchDrawerController() : super(BottomSearchControllerState.close);

  void open() {
    value = BottomSearchControllerState.open;
  }

  void close() {
    value = BottomSearchControllerState.close;
  }
}

enum BottomSearchControllerState { open, close }
