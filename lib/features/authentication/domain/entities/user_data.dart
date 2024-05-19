import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String email;
  final String password;
  final String? firstName;
  final String? lastName;

  const UserData(
      {required this.email,
      required this.password,
      this.firstName,
      this.lastName});

  @override
  List<Object?> get props => [
        email,
        password,
        firstName,
        lastName,
      ];
}
