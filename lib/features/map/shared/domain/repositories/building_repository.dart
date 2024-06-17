import 'package:fpdart/fpdart.dart';
import 'package:istu_map/features/map/shared/domain/entities/waypoint.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/building.dart';

abstract interface class BuildingRepository {
  Future<Either<Failure, List<Building>>> getAll();
  Future<Either<Failure, Building>> getBuilding(String buildingId);
  Future<Either<Failure, String>> getBuildingIdByObjectId(String objectId);
  Future<Either<Failure, Waypoint>> getObject(String objectId);
}
