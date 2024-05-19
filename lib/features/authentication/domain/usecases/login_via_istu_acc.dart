import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/usecases/usecase.dart';

class LoginViaIstuAcc extends Usecase<void, NoParams> {
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
