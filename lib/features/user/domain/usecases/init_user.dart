import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/user/domain/entities/user.dart';
import 'package:istu_map/features/user/domain/repositories/user_repository.dart';

class InitUser extends Usecase<User, NoParams> {
  final UserRepository repository;

  InitUser(this.repository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getUser();
  }
}
