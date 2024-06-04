import 'package:fpdart/fpdart.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/domain/usecases/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/exteral_route.dart';
import '../repositories/external_route_repository.dart';

class GetExternalRoute extends Usecase<ExternalRoute, GetExternalRouteParams> {
  final ExternalRouteRepository externalRouteRepository;

  GetExternalRoute(this.externalRouteRepository);
  @override
  Future<Either<Failure, ExternalRoute>> call(params) async {
    return await externalRouteRepository.getRoute(params.from, params.toId);
  }
}

class GetExternalRouteParams extends NoParams {
  final LatLng from;
  final String toId;

  GetExternalRouteParams({required this.from, required this.toId});

  @override
  List<Object?> get props => [from, toId];
}
