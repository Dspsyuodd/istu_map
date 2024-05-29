import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/external_map/domain/entities/exteral_route.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/get_route.dart';
import 'package:istu_map/features/map/shared/domain/entities/building.dart';
import 'package:istu_map/features/map/shared/domain/repositories/building_repository.dart';
import 'package:istu_map/features/user/domain/entities/lesson.dart';
import 'package:latlong2/latlong.dart';

class GetRouteToLesson extends Usecase<(ExternalRoute, Building), GetRouteToLessonParams> {
  final GetExternalRoute getRoute;
  final BuildingRepository repository;
  GetRouteToLesson(this.getRoute, this.repository);

  @override
  Future<Either<Failure, (ExternalRoute, Building)>> call(params) async {
    var buildingId =
        await repository.getBuildingIdByObjectId(params.lesson.audienceId);
    return await buildingId.fold(
      (l) async => Left(l),
      (buildingId) async {
        var buiding = await repository.getBuilding(buildingId);
        return await buiding.fold(
          (l) async => Left(l),
          (building) async {
            var route = await getRoute(
                GetExternalRouteParams(from: params.from, to: building));
            return route.fold(
              (l) => Left(l),
              (route) {
                return Right((route, building));
              },
            );
          },
        );
      },
    );
  }
}

class GetRouteToLessonParams extends NoParams {
  final Lesson lesson;
  final LatLng from;

  GetRouteToLessonParams(this.lesson, this.from);

  @override
  List<Object?> get props => [lesson];
}
