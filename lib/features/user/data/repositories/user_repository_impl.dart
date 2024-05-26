import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/features/user/data/datasources/user_api.dart';
import 'package:istu_map/features/user/domain/entities/lesson.dart';
import 'package:istu_map/features/user/domain/entities/user.dart';
import 'package:istu_map/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends ExceptionsHandler implements UserRepository {
  final UserApi userApi;

  UserRepositoryImpl(this.userApi, super.networkInfo);

  @override
  Future<Either<Failure, List<Lesson>>> getShedule() {
    return getEither(() => userApi.getShedule());
  }

  @override
  Future<Either<Failure, User>> getUser() {
    return getEither(() => userApi.getUser());
  }
}
