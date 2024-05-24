import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/route.dart';

class CreateRoute extends Usecase<Route, CreateRouteParams> {
  @override
  Future<Either<Failure, Route>> call(CreateRouteParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class CreateRouteParams extends NoParams {
  final String fromId;
  final String toId;

  CreateRouteParams({required this.fromId, required this.toId});

  @override
  List<Object?> get props => [fromId, toId];
}
