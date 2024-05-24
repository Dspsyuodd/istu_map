import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/floor.dart';
import 'package:istu_map/features/map/internal_map/domain/repositories/floor_repository.dart';

class FloorRepositoryImpl implements FloorRepository {
  @override
  Future<Either<Failure, Floor>> getFloor(buildingId, floorNumber) {
    // TODO: implement getFloor
    throw UnimplementedError();
  }
}
