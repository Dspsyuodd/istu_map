import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/route_floor.dart';
import 'package:istu_map/features/map/internal_map/domain/repositories/floor_repository.dart';

class CreateRoute extends Usecase<InternalRoute, CreateRouteParams> {
  final FloorRepository _floorRepository;

  CreateRoute(this._floorRepository);
  @override
  Future<Either<Failure, InternalRoute>> call(CreateRouteParams params) async {
    return await _floorRepository.createRoute(params.fromId, params.toId);
  }
}

class CreateRouteParams extends NoParams {
  final String fromId;
  final String toId;

  CreateRouteParams({required this.fromId, required this.toId});

  @override
  List<Object?> get props => [fromId, toId];
}
