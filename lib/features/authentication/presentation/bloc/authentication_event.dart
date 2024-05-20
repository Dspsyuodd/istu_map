part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthenticationEvent {
  final UserData data;

  const RegisterEvent(this.data);

  @override
  List<Object> get props => [data];
}

class LoginEvent extends AuthenticationEvent {
  final UserData data;

  const LoginEvent(this.data);

  @override
  List<Object> get props => [data];
}