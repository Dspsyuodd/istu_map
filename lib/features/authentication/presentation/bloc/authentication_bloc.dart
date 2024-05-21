import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:istu_map/features/authentication/domain/usecases/initialize.dart';
import 'package:istu_map/features/authentication/domain/usecases/login.dart';
import 'package:istu_map/features/authentication/domain/usecases/login_via_istu_acc.dart';
import 'package:istu_map/features/authentication/domain/usecases/register.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Login login;
  final Register register;
  final LoginViaIstuAcc loginViaIstuAcc;
  final Initialize initialize;

  AuthenticationBloc(this.login, this.register, this.loginViaIstuAcc, this.initialize)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is InitEvent) {
        emit(AuthenticationInitial());
        var userData = await initialize();
        userData.fold(
          (l) => _emitError(l, emit),
          (r) => emit(LoginSuccess(r)),
        );
      }

      if (event is RegisterEvent) {
        emit(AuthenticationLoading());
        var result = await register(
          RegisterParams(
            email: event.data.userDto.email,
            password: event.data.userDto.password!,
            firstName: event.data.userDto.firstName!,
            lastName: event.data.userDto.lastName!,
          ),
        );
        result.fold(
          (l) => _emitError(l, emit),
          (r) {
            emit(RegistrationSuccess(r));
          },
        );
      }

      if (event is LoginEvent) {
        emit(AuthenticationLoading());

        var result = await login(
          LoginParams(
            email: event.data.userDto.email,
            password: event.data.userDto.password!,
          ),
        );

        result.fold(
          (l) => _emitError(l, emit),
          (r) {
            emit(LoginSuccess(r.userDto));
          },
        );
      }
    });
  }

  void _emitError(Failure l, Emitter<AuthenticationState> emit) {
    if (l is UnknownFailure) {
      log(l.message);
      log(l.stackTrace);
    }

    if (l is ServerFailure) {
      log(l.message);
    }

    emit(AuthenticationFailure());
  }
}
