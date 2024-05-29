import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
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
  Lesson? _selectedLesson;
  User? _user;
  List<Lesson>? _shedule;

  UserBloc(this.getUser, this.getShedule) : super(const _Initial()) {
    on<UserEvent>((event, emit) async {
      await event.when(
        started: () async {},
        getUserData: () async {
          await _getUserData(emit);
        },
        selectLesson: (lesson) {
          _selectedLesson = lesson;
          emit(UserState.success(_user!, _shedule!, _selectedLesson));
        },
      );
    });
  }

  Future<void> _getUserData(Emitter<UserState> emit) async {
    emit(const UserState.loading());
    var userEither = await getUser(NoParams());
    var scheduleEither = await getShedule(NoParams());
    var resultEither = userEither.flatMap(
      (user) {
        return scheduleEither.map((shedule) {
          return (user, shedule);
        });
      },
    );
    resultEither.fold(
      (l) => _emitError(l, emit),
      (r) {
        _user = r.$1;
        _shedule = r.$2;
        emit(UserState.success(r.$1, r.$2, _selectedLesson));
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
