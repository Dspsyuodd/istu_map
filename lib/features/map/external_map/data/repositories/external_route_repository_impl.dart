import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/external_map/domain/entities/exteral_route.dart';
import 'package:istu_map/features/map/external_map/domain/repositories/external_route_repository.dart';
import 'package:latlong2/latlong.dart';

class ExternalRouteRepositoryImpl implements ExternalRouteRepository {
  @override
  Future<Either<Failure, ExternalRoute>> getRoute(
      LatLng from, String toBuildingId) {
    // TODO: implement getRoute
    throw UnimplementedError();
  }
}
