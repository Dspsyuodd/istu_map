import 'package:fpdart/fpdart.dart';
import '../../../../../core/errors/failure.dart';
import 'package:latlong2/latlong.dart';

abstract interface class GeopositionRepository {
  void addListener(void Function(Either<Failure, LatLng>) listener);
  Future<Either<Failure, LatLng>> getCurrentPosition();
  void dispose();
}
