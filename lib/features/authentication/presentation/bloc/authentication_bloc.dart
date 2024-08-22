import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/features/authentication/domain/usecases/logout.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/entities/user_dto.dart';
import '../../domain/usecases/initialize.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/login_via_istu_acc.dart';
import '../../domain/usecases/register.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Login login;
  final Logout logout;
  final Register register;
  final LoginViaIstuAcc loginViaIstuAcc;
  final InitializeTokens initialize;

  AuthenticationBloc(this.login, this.register, this.loginViaIstuAcc,
      this.initialize, this.logout)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is LogoutEvent) {
        emit(AuthenticationLoading());
        await logout(NoParams());
        emit(const LogoutSuccess());
      }
      if (event is OauthEvent) {
        emit(AuthenticationLoading());
        var result = await loginViaIstuAcc(
            LoginViaIstuAccParams(event.callbackUri.uriValue));
        result.fold(
          (l) => _emitError(l, emit),
          (r) => emit(const LoginSuccess()),
        );
      }
      if (event is InitEvent) {
        emit(AuthenticationInitial());
        var userData = await initialize(NoParams());
        userData.fold(
          (l) => _emitError(l, emit),
          (r) => emit(const LoginSuccess()),
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
          (r) => emit(RegistrationSuccess(r)),
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
            emit(const LoginSuccess());
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
