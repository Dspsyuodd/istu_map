import 'package:fpdart/fpdart.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../shared/domain/entities/building.dart';
import '../../../shared/domain/repositories/building_repository.dart';

class LoadMap extends Usecase<List<Building>, NoParams> {
  final BuildingRepository buildingRepository;

  LoadMap(this.buildingRepository);

  @override
  Future<Either<Failure, List<Building>>> call(params) async {
    return await buildingRepository.getAll();
  }
}
