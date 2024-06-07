import 'package:flutter/material.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';

class SheduleListElement {
  final String name;
  final String teacher;
  final String auditory;

  SheduleListElement({
    required this.name,
    required this.teacher,
    required this.auditory,
  });
}

class ScheduleList extends StatefulWidget {
  const ScheduleList(
      {Key? key,
      required this.width,
      required this.spacing,
      required this.shedule,
      this.onTap,
      this.onLessonSelected,
      this.initialIndex})
      : super(key: key);
  final double width;
  final double spacing;
  final List<SheduleListElement> shedule;
  final void Function(int index, int selectedIndex)? onTap;
  final void Function(int index)? onLessonSelected;
  final int? initialIndex;

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList>
    with SingleTickerProviderStateMixin {
  late List<GlobalKey<_ScheduleListState>> scheduleKeys;
  late AnimationController controller;
  Widget? circles;
  var positionOffset = 0.0;
  var sirclesPositions = <double>[];
  var maxOffset = 0.0;
  var currentPosition = 0;

  @override
  void initState() {
    // currentPosition = widget.initialIndex ?? 0;
    _rebuild();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    controller.value = 1;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialIndex != null) {
        _moveTo(widget.initialIndex!);
      }
    });
  }

  @override
  void didUpdateWidget(ScheduleList oldWidget) {
    if (oldWidget.shedule != widget.shedule) {
      _rebuild();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _rebuild() {
    scheduleKeys = List.generate(
        widget.shedule.length, (int _) => GlobalKey<_ScheduleListState>());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _buildCircles();
        if (scheduleKeys.isNotEmpty) {
          var containerHeights = scheduleKeys
              .map((e) => _getContainerHeight(e.currentContext))
              .toList();
          positionOffset =
              _getContainerHeight(scheduleKeys.first.currentContext);
          maxOffset =
              containerHeights.reduce((value, element) => value + element);
          maxOffset += widget.spacing * (scheduleKeys.length - 1);
          maxOffset -= containerHeights.first / 2;
          maxOffset -= containerHeights.last / 2;
          sirclesPositions = [];
          sirclesPositions.add(0.0);
          for (var i = 1; i < scheduleKeys.length; i++) {
            sirclesPositions.add(sirclesPositions[i - 1] +
                containerHeights[i - 1] / 2 +
                containerHeights[i] / 2 +
                widget.spacing);
          }
        }
      });
    });
  }

  void _moveTo(int index) {
    controller
        .animateTo(1 - sirclesPositions[index] / maxOffset,
            curve: Curves.easeOut)
        .whenComplete(() => setState(() {
              currentPosition = index;
              _buildCircles();
            }));
  }

  void _moveToClosest(double position) {
    var index = sirclesPositions.asMap().entries.reduce((value, element) {
      return (value.value - position).abs() > (element.value - position).abs()
          ? element
          : value;
    });
    _moveTo(sirclesPositions.length - index.key - 1);
  }

  @override
  Widget build(BuildContext context) {
    var startPosition =
        MediaQuery.of(context).size.height / 2 - positionOffset - maxOffset + 5;
    return AnimatedBuilder(
      builder: (context, _) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragUpdate: (details) {
            controller.value += details.delta.dy / maxOffset;
          },
          onVerticalDragEnd: (details) {
            if (controller.isDismissed) {
              setState(() {
                currentPosition = scheduleKeys.length - 1;
                _buildCircles();
              });
              return;
            }
            if (controller.isCompleted) {
              setState(() {
                currentPosition = 0;
                _buildCircles();
              });
              return;
            }
            _moveToClosest(controller.value * maxOffset +
                details.velocity.pixelsPerSecond.dy /
                    MediaQuery.of(context).size.width *
                    20);
            widget.onLessonSelected?.call(currentPosition);
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: startPosition + controller.value * maxOffset,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: circles ?? Container(),
                    ),
                    Column(
                      children: _buildScheduleList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      animation: controller,
    );
  }

  List<Widget> _buildScheduleList() {
    return widget.shedule.asMap().entries.map((e) {
      var color = AppTheme.of(context).colorScheme.secondary.withOpacity(0.5);
      if (e.key > currentPosition) {
        color = AppTheme.of(context).colorScheme.brightness == Brightness.dark
            ? Colors.white.withOpacity(0.1)
            : Colors.black.withOpacity(0.1);
      }
      if (e.key < currentPosition) {
        color = Colors.transparent;
      }
      return Padding(
        padding: EdgeInsets.symmetric(vertical: widget.spacing / 2),
        child: GestureDetector(
          onTap: () {
            widget.onTap?.call(e.key, currentPosition);
            _moveTo(e.key);
          },
          child: AnimatedContainer(
            key: scheduleKeys[e.key],
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            width: widget.width,
            duration: const Duration(milliseconds: 200),
            child: Opacity(
              opacity: 0.8,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.value.name,
                        style: AppTheme.of(context).textTheme.displaySmall),
                    Text(e.value.auditory,
                        style: AppTheme.of(context).textTheme.displaySmall),
                    Text(e.value.teacher,
                        style: AppTheme.of(context).textTheme.displaySmall),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  void _buildCircles() {
    if (scheduleKeys.isEmpty) return;
    final theme = AppTheme.of(context);
    final notSelectedColor = theme.colorScheme.brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    var circlesList = <Widget>[];
    var circleSize = 47.0;
    var height =
        (scheduleKeys.first.currentContext?.findRenderObject() as RenderBox)
            .size
            .height;
    circlesList.add(SizedBox(
      height: (height - circleSize) / 2 + widget.spacing / 2,
    ));
    for (var i = 0; i < scheduleKeys.length; i++) {
      circlesList.add(ScheduleListCircle(
        color: i == currentPosition
            ? theme.colorScheme.secondary
            : notSelectedColor.withOpacity(0.5),
      ));
      if (i < scheduleKeys.length - 1) {
        var height = _getContainerHeight(scheduleKeys[i].currentContext) - 47;
        var nextHeight =
            _getContainerHeight(scheduleKeys[i + 1].currentContext) - 47;
        circlesList.add(ScheduleListLine(
          firstColor: i == currentPosition
              ? theme.colorScheme.secondary
              : notSelectedColor.withOpacity(0.5),
          height: height / 2 + nextHeight / 2 + widget.spacing,
          secondColor: i + 1 == currentPosition
              ? theme.colorScheme.secondary
              : notSelectedColor.withOpacity(0.5),
        ));
      }
    }
    height = (scheduleKeys.last.currentContext?.findRenderObject() as RenderBox)
        .size
        .height;
    circlesList.add(SizedBox(
      height: (height - circleSize) / 2 + widget.spacing / 2,
    ));
    circles = Column(
      children: circlesList,
    );
  }

  double _getContainerHeight(BuildContext? context) {
    return (context?.findRenderObject() as RenderBox).size.height;
  }
}

class ScheduleListCircle extends StatelessWidget {
  const ScheduleListCircle({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        height: 19,
        width: 19,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: color),
        ),
      ),
    );
  }
}

class ScheduleListLine extends StatelessWidget {
  const ScheduleListLine(
      {Key? key,
      required this.height,
      required this.firstColor,
      required this.secondColor})
      : super(key: key);
  final double height;
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [firstColor, secondColor],
        ),
      ),
    );
  }
}
