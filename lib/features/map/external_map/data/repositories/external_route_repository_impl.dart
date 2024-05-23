import 'package:fpdart/fpdart.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/errors/server_errors_handler.dart';
import '../../../../../core/extensions/latlng.dart';
import '../datasources/extertnal_route_api.dart';
import '../../domain/entities/exteral_route.dart';
import '../../domain/repositories/external_route_repository.dart';
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
