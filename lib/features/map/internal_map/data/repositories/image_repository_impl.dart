import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/internal_map/data/datasources/image_local_data_source.dart';
import 'package:istu_map/features/map/internal_map/domain/repositories/image_repository.dart';

import '../datasources/image_api.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageLocalDataSource imageLocalDataSource;
  final ImageApi imageApi;

  ImageRepositoryImpl(this.imageLocalDataSource, this.imageApi);

  @override
  Future<Either<Failure, Uint8List>> getImageBytes(objectId) {
    // TODO: implement getImageBytes
    throw UnimplementedError();
  }
}
