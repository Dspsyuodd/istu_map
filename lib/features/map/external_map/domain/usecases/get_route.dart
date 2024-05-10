import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/exteral_route.dart';
import '../repositories/external_route_repository.dart';
import '../../../shared/domain/entities/building.dart';
import 'package:latlong2/latlong.dart';

class GetExternalRoute extends Usecase<ExternalRoute, GetExternalRouteParams> {
  final ExternalRouteRepository externalRouteRepository;

  GetExternalRoute(this.externalRouteRepository);
  @override
  Future<Either<Failure, ExternalRoute>> call(params) async {
    return await externalRouteRepository.getRoute(params.from, params.to.id);
  }
}

class GetExternalRouteParams extends Equatable {
  final LatLng from;
  final Building to;

  const GetExternalRouteParams({required this.from, required this.to});
  @override
  List<Object?> get props => [from, to];
}
