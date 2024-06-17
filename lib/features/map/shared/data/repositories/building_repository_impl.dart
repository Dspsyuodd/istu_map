import 'package:fpdart/fpdart.dart';
import 'package:istu_map/features/map/shared/domain/entities/waypoint.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/errors/server_errors_handler.dart';
import '../datasources/building_data_source.dart';
import '../../domain/entities/building.dart';
import '../../domain/repositories/building_repository.dart';

class BuildingRepositoryImpl extends ExceptionsHandler
    implements BuildingRepository {
  final BuildingApi _buildingApi;

  BuildingRepositoryImpl(this._buildingApi, super.networkInfo);

  @override
  Future<Either<Failure, List<Building>>> getAll() {
    return getEither(() => _buildingApi.getAll());
  }

  @override
  Future<Either<Failure, Building>> getBuilding(String buildingId) {
    return getEither(() => _buildingApi.getBulding(buildingId));
  }

  @override
  Future<Either<Failure, String>> getBuildingIdByObjectId(String objectId) {
    return getEither(() =>
        _buildingApi.getObject(objectId).then((value) => value.buildingId));
  }

  @override
  Future<Either<Failure, Waypoint>> getObject(String objectId) {
    return getEither(() =>
        _buildingApi.getObject(objectId));
  }
}
