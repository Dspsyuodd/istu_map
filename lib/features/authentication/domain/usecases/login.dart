import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/usecases/usecase.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:istu_map/features/authentication/domain/repositories/authentication_repositoru.dart';

class Login extends Usecase<void, LoginParams> {
  final AuthenticationRepository authenticationRepository;

  Login(this.authenticationRepository);
  @override
  Future<Either<Failure, void>> call(LoginParams params) {
    return authenticationRepository
        .login(UserData(email: params.email, password: params.password));
  }
}

class LoginParams extends NoParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
