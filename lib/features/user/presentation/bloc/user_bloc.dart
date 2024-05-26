import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/user/domain/entities/lesson.dart';
import 'package:istu_map/features/user/domain/entities/user.dart';
import 'package:istu_map/features/user/domain/usecases/get_shedule.dart';
import 'package:istu_map/features/user/domain/usecases/init_user.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final InitUser getUser;
  final GetShedule getShedule;

  UserBloc(this.getUser, this.getShedule) : super(const _Initial()) {
    on<UserEvent>((event, emit) async {
      await event.when(
        started: () async {},
        getUserData: () async {
          await _getUserData(emit);
        },
      );
    });
  }

  Future<void> _getUserData(Emitter<UserState> emit) async {
    emit(const UserState.loading());
    var userEither = await getUser(NoParams());
    var scheduleEither = await getShedule(NoParams());
    userEither.fold(
      (l) => _emitError(l, emit),
      (r) {
        emit(UserState.success(r, []));
      },
    );
    userEither.flatMap(
      (user) {
        return scheduleEither.map((shedule) {
          emit(UserState.success(user, shedule));
        });
      },
    );
  }

  void _emitError(Failure l, Emitter<UserState> emit) {
    if (l is UnknownFailure) {
      log(l.message);
      log(l.stackTrace);
    }
    if (l is ServerFailure) {
      log(l.message);
    }
    emit(const UserState.failure());
  }
}
