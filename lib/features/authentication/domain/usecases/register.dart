import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/usecases/usecase.dart';

class Register extends Usecase<void, RegisterParams> {
  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    // TODO: implement call
    throw UnimplementedError();
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
