import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';

abstract interface class ImageRepository {
  Future<Either<Failure, Uint8List>> getImageBytes(String objectId);
}