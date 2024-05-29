import 'package:fpdart/src/either.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';

class AddImage extends Usecase<String, AddImageParams> {
  @override
  Future<Either<Failure, String>> call(AddImageParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}

class AddImageParams {
}