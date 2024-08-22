import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/user_dto.dart';
import '../repositories/authentication_repository.dart';

class Register extends Usecase<UserDto, RegisterParams> {
  final AuthenticationRepository authenticationRepository;

  Register(this.authenticationRepository);
  @override
  Future<Either<Failure, UserDto>> call(RegisterParams params) {
    return authenticationRepository.registration(
      UserDto(
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
