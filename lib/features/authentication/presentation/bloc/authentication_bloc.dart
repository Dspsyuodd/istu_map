import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
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

  AuthenticationBloc(this.login, this.register, this.loginViaIstuAcc)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(AuthenticationLoading());
        var result = await register(
          RegisterParams(
            email: event.data.email,
            password: event.data.password,
            firstName: event.data.firstName!,
            lastName: event.data.lastName!,
          ),
        );
        result.fold(
          (l) => null,
          (r) {
            emit(RegistrationSuccess());
          },
        );
      }
    });
  }
}
