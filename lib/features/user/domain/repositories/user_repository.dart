import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/user/domain/entities/lesson.dart';
import 'package:istu_map/features/user/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, List<Lesson>>> getShedule();
}
