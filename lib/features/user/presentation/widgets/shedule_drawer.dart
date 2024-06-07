import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/features/user/domain/entities/lesson.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';
import 'package:istu_map/features/user/presentation/widgets/schedule_list.dart';

class ScheduleDrawer extends StatelessWidget {
  const ScheduleDrawer(
      {Key? key, this.onTap, this.onLessonSelected, this.initialIndex})
      : super(key: key);
  final void Function(Lesson, Lesson)? onTap;
  final void Function(Lesson)? onLessonSelected;
  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (user, shedule, selected) {
            if (user.role == 2) {
              return ScheduleList(
                initialIndex: initialIndex,
                onTap: (index, currentSelected) {
                  onTap?.call(shedule[index], shedule[currentSelected]);
                  BlocProvider.of<UserBloc>(context)
                      .add(UserEvent.selectLesson(shedule[index]));
                },
                onLessonSelected: (index) {
                  onLessonSelected?.call(shedule[index]);
                  BlocProvider.of<UserBloc>(context)
                      .add(UserEvent.selectLesson(shedule[index]));
                },
                width: MediaQuery.of(context).size.width * 0.38,
                spacing: 67,
                shedule: shedule
                    .map(
                      (e) => SheduleListElement(
                        name: e.title,
                        teacher: e.lector,
                        auditory: e.audience,
                        startTime: DateTime.parse(e.startTime),
                        endTime: DateTime.parse(e.endTime)
                      ),
                    )
                    .toList(),
              );
            }
            return const Center(
              child: Text("Поступайте в ИжГту!"),
            );
          },
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
