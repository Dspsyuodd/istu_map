import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/geoposition_repository.dart';

class GeopositionRepositoryImpl implements GeopositionRepository {
  GeopositionRepositoryImpl();
  final List<StreamSubscription<LocationData>> _subscribtions = [];

  @override
  void dispose() {
    for (var element in _subscribtions) {
      element.cancel();
    }
  }

  @override
  void addListener(void Function(Either<Failure, LatLng>) listener) {
    var subscription = Location().onLocationChanged.listen((position) {
      var latlng = LatLng(position.latitude ?? 0, position.longitude ?? 0);
      listener(Right(latlng));
    });

    _subscribtions.add(subscription);
  }

  @override
  Future<Either<Failure, LatLng>> getCurrentPosition() async {
    var position = await Location().getLocation();
    return Right(LatLng(position.latitude ?? 0, position.longitude ?? 0));
  }
}
