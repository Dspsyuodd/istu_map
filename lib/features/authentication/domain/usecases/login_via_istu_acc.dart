import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/usecases/usecase.dart';
import 'package:istu_map/features/authentication/domain/repositories/authentication_repository.dart';

class LoginViaIstuAcc extends Usecase<void, NoParams> {
  final AuthenticationRepository authenticationRepository;

  LoginViaIstuAcc(this.authenticationRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
