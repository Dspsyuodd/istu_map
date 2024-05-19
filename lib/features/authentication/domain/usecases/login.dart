import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/usecases/usecase.dart';

class Login extends Usecase<void, LoginParams> {
  @override
  Future<Either<Failure, void>> call(LoginParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class LoginParams extends NoParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
