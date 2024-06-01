part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends AuthenticationEvent {
  const InitEvent();
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

class LogoutEvent extends AuthenticationEvent {
  const LogoutEvent();
}

class OauthEvent extends AuthenticationEvent {
  const OauthEvent(this.callbackUri);
  final WebUri callbackUri;

  @override
  List<Object> get props => [callbackUri];
}
