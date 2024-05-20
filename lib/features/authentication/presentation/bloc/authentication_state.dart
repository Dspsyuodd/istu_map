part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {}

class RegistrationSuccess extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {}
