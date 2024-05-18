import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/features/map/shared/data/datasources/building_data_source.dart';
import 'package:istu_map/features/map/shared/domain/entities/building.dart';
import 'package:istu_map/features/map/shared/domain/repositories/building_repository.dart';

class BuildingRepositoryImpl extends ExceptionsHandler
    implements BuildingRepository {
  final BuildingApi _buildingApi;

  BuildingRepositoryImpl(this._buildingApi, super.networkInfo);

  @override
  Future<Either<Failure, List<Building>>> getAll() {
    return getEither(() => _buildingApi.getAll());
  }
}
