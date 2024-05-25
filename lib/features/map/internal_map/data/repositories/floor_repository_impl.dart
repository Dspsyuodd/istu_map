import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/features/map/internal_map/data/datasources/floor_api.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/floor.dart';
import 'package:istu_map/features/map/internal_map/domain/repositories/floor_repository.dart';

class FloorRepositoryImpl extends ExceptionsHandler implements FloorRepository {
  final FloorApi _floorApi;

  FloorRepositoryImpl(this._floorApi, super.networkInfo);

  @override
  Future<Either<Failure, Floor>> getFloor(buildingId, floorNumber) async {
    return getEither(() => _floorApi.getFloor(buildingId, floorNumber));
  }
}
