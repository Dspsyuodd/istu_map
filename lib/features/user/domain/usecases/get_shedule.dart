import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/user/domain/entities/lesson.dart';
import 'package:istu_map/features/user/domain/repositories/user_repository.dart';

class GetShedule extends Usecase<List<Lesson>, NoParams> {
  final UserRepository repository;

  GetShedule(this.repository);
  @override
  Future<Either<Failure, List<Lesson>>> call(NoParams params) async {
    return await repository.getShedule();
  }
}
