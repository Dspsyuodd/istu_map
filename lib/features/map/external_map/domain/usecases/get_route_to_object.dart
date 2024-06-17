import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/external_map/domain/entities/exteral_route.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/get_route.dart';
import 'package:istu_map/features/map/shared/domain/repositories/building_repository.dart';
import 'package:latlong2/latlong.dart';

class GetRouteToObject extends Usecase<ExternalRoute, GetRouteToObjectParams> {
  final BuildingRepository repository;
  final GetExternalRoute getRoute;

  GetRouteToObject(this.repository, this.getRoute);
  @override
  Future<Either<Failure, ExternalRoute>> call(params) async {
    var object = await repository.getObject(params.objectId);
    return await object.fold(
      (l) async => Left(l),
      (r) async => await getRoute(
        GetExternalRouteParams(
          from: params.from,
          toId: r.buildingId,
        ),
      ),
    );
  }
}

class GetRouteToObjectParams extends NoParams {
  final String objectId;
  final LatLng from;

  GetRouteToObjectParams(this.objectId, this.from);

  @override
  List<Object?> get props => [objectId];
}
