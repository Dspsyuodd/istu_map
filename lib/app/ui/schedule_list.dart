import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

final shedule = [
  SheduleListElement(
    name: 'Сети и телекоммуникации',
    teacher: 'Ардашев Б.С.',
    auditory: '3-714',
  ),
  SheduleListElement(
    name: 'Теория цифровой обработки сигналов',
    teacher: 'Архипов И.О.',
    auditory: '3-714',
  ),
  SheduleListElement(
    name: 'Математические основы искусственного интеллекта',
    teacher: 'Брычкина М.С.',
    auditory: '3-204а',
  ),
  SheduleListElement(
    name: 'Математические основы искусственного интеллекта',
    teacher: 'Брычкина М.С.',
    auditory: '3-204а',
  ),
];

class SheduleListElement {
  final String name;
  final String teacher;
  final String auditory;

  SheduleListElement(
      {required this.name, required this.teacher, required this.auditory});
}

class ScheduleList extends StatefulWidget {
  const ScheduleList({Key? key, required this.width, required this.spacing})
      : super(key: key);
  final double width;
  final double spacing;

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList>
    with SingleTickerProviderStateMixin {
  final scheduleKeys =
      List.generate(shedule.length, (int _) => GlobalKey<_ScheduleListState>());
  late AnimationController controller;
  Widget? circles;
  var positionOffset = 0.0;
  var sirclesPositions = <double>[];
  var maxOffset = 0.0;
  var currentPosition = 0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    controller.value = 1;
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
    super.initState();
  }

  void _moveTo(int index) {
    controller
        .animateTo(1 - sirclesPositions[index] / maxOffset, curve: Curves.easeOut)
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
    return shedule.asMap().entries.map((e) {
      var color = AppTheme.of(context).colorScheme.secondary.withOpacity(0.5);
      if (e.key > currentPosition) {
        color = Colors.white.withOpacity(0.1);
      }
      if (e.key < currentPosition) {
        color = Colors.transparent;
      }
      return Padding(
        padding: EdgeInsets.symmetric(vertical: widget.spacing / 2),
        child: GestureDetector(
          onTap: () {
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
                    Text(e.value.name, style: const TextStyle(fontSize: 12)),
                    Text(e.value.auditory,
                        style: const TextStyle(fontSize: 12)),
                    Text(e.value.teacher, style: const TextStyle(fontSize: 12)),
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
    final theme = AppTheme.of(context);
    var circlesList = <Widget>[];
    var circleSize = 47.0;
    if (scheduleKeys.isNotEmpty) {
      var height =
          (scheduleKeys.first.currentContext?.findRenderObject() as RenderBox)
              .size
              .height;
      circlesList.add(SizedBox(
        height: (height - circleSize) / 2 + widget.spacing / 2,
      ));
    }
    for (var i = 0; i < scheduleKeys.length; i++) {
      circlesList.add(ScheduleListCircle(
        color: i == currentPosition
            ? theme.colorScheme.secondary
            : Colors.white.withOpacity(0.5),
      ));
      if (i < scheduleKeys.length - 1) {
        var height = _getContainerHeight(scheduleKeys[i].currentContext) - 47;
        var nextHeight =
            _getContainerHeight(scheduleKeys[i + 1].currentContext) - 47;
        circlesList.add(ScheduleListLine(
          firstColor: i == currentPosition
              ? theme.colorScheme.secondary
              : Colors.white.withOpacity(0.5),
          height: height / 2 + nextHeight / 2 + widget.spacing,
          secondColor: i + 1 == currentPosition
              ? theme.colorScheme.secondary
              : Colors.white.withOpacity(0.5),
        ));
      }
    }
    var height =
        (scheduleKeys.last.currentContext?.findRenderObject() as RenderBox)
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
