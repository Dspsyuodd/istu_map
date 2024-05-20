import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/usecases/usecase.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:istu_map/features/authentication/domain/repositories/authentication_repositoru.dart';

class Register extends Usecase<void, RegisterParams> {
  final AuthenticationRepository authenticationRepository;

  Register(this.authenticationRepository);
  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    return authenticationRepository.registration(
      UserData(
        email: params.email,
        password: params.password,
        firstName: params.firstName,
        lastName: params.lastName,
      ),
    );
  }
}

class RegisterParams extends NoParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  RegisterParams(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});
}
