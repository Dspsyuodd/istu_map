import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserData extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  @JsonKey(name: 'User')
  final UserDto userDto;

  const UserData({required this.userDto, this.accessToken, this.refreshToken});

  @override
  List<Object?> get props => [accessToken, refreshToken, userDto];
}

class UserDto extends Equatable {
  final String email;
  final String? password;
  final String? firstName;
  final String? lastName;

  const UserDto(
      {required this.email, this.password, this.firstName, this.lastName});

  @override
  List<Object?> get props => [email, password, firstName, lastName];
}
