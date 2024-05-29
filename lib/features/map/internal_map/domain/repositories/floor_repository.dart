import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/floor.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/route_floor.dart';

abstract interface class FloorRepository {
  Future<Either<Failure, Floor>> getFloor(String buildingId, int floorNumber);
  Future<Either<Failure, InternalRoute>> createRoute(String from, String to);
}
