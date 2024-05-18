import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/core/extensions/latlng.dart';
import 'package:istu_map/features/map/external_map/data/datasources/extertnal_route_api.dart';
import 'package:istu_map/features/map/external_map/domain/entities/exteral_route.dart';
import 'package:istu_map/features/map/external_map/domain/repositories/external_route_repository.dart';
import 'package:latlong2/latlong.dart';

class ExternalRouteRepositoryImpl extends ExceptionsHandler
    implements ExternalRouteRepository {
  final ExternalRouteApi externalRouteApi;

  ExternalRouteRepositoryImpl(this.externalRouteApi, super.networkInfo);
  @override
  Future<Either<Failure, ExternalRoute>> getRoute(
      LatLng from, String toBuildingId) async {
    return getEither(
        () => externalRouteApi.getRoute({
          "Type": 0,
          "BuildingId": toBuildingId,
          ...from.toDto(),
        }));
  }
}
