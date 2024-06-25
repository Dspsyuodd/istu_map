import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/authentication/domain/repositories/token_repository.dart';

class Logout extends Usecase<Future<void>, NoParams> {
  final TokenRepository repository;

  Logout(this.repository);

  @override
  Future<Either<Failure, Future<void>>> call(NoParams params) async {
    await repository.clearStorage();
    return right(Future.value());
  }
}
