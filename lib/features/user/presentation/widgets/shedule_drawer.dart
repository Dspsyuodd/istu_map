import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';
import 'package:istu_map/features/user/presentation/widgets/schedule_list.dart';

class ScheduleDrawer extends StatelessWidget {
  const ScheduleDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return ScheduleList(
          width: MediaQuery.of(context).size.width * 0.38,
          spacing: 67,
          shedule: state.maybeWhen(
            success: (user, shedule) => shedule
                .map(
                  (e) => SheduleListElement(
                    name: e.title,
                    teacher: e.lector,
                    auditory: e.audience,
                  ),
                )
                .toList(),
            orElse: () => [],
          ),
        );
      },
    );
  }
}
