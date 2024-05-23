import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/authentication_repository.dart';

class LoginViaIstuAcc extends Usecase<void, NoParams> {
  final AuthenticationRepository authenticationRepository;

  LoginViaIstuAcc(this.authenticationRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
