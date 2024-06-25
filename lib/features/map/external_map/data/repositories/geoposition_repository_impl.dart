import 'dart:async';
import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/geoposition_repository.dart';

class GeopositionRepositoryImpl implements GeopositionRepository {
  GeopositionRepositoryImpl();
  final List<StreamSubscription<Position>> _subscribtions = [];

  @override
  void dispose() {
    for (var element in _subscribtions) {
      element.cancel();
    }
  }

  @override
  void addListener(void Function(Either<Failure, LatLng>) listener) {
    var subscription = Geolocator.getPositionStream().listen((position) {
      var latlng = LatLng(position.latitude, position.longitude);
      print(latlng.toString());
      listener(Right(latlng));
    });

    _subscribtions.add(subscription);
  }

  @override
  Future<Either<Failure, LatLng>> getCurrentPosition() async {
    var position = await Geolocator.getCurrentPosition();
    print(position.toString());
    return Right(LatLng(position.latitude, position.longitude));
  }
}
