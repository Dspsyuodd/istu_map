import 'dart:io';
import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/image_dto.dart';

abstract interface class ImageRepository {
  Future<Either<Failure, List<ImageDto>>> getImages(String objectId);
  Future<Either<Failure, Uint8List>> getImageBytes(String imageId);
  Future<Either<Failure, String>> uploadImage(String objectId, File image);
}
