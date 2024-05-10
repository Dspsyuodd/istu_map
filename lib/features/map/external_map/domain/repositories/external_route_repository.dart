import 'package:fpdart/fpdart.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/exteral_route.dart';
import 'package:latlong2/latlong.dart';

abstract interface class ExternalRouteRepository {
  Future<Either<Failure, ExternalRoute>> getRoute(LatLng from, String toBuildingId);
}