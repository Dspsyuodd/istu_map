import 'package:fpdart/fpdart.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/building.dart';

abstract interface class BuildingRepository {
  Future<Either<Failure, List<Building>>> getAll();
}
