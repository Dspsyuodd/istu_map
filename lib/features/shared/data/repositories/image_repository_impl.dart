import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/features/shared/data/datasources/image_local_data_source.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/image_dto.dart';
import 'package:istu_map/features/shared/domain/repositories/image_repository.dart';

import '../datasources/image_api.dart';

class ImageRepositoryImpl extends ExceptionsHandler implements ImageRepository {
  final ImageLocalDataSource imageLocalDataSource;
  final ImageApi imageApi;

  ImageRepositoryImpl(
      this.imageLocalDataSource, this.imageApi, super.networkInfo);

  @override
  Future<Either<Failure, List<ImageDto>>> getImages(objectId) async {
    return await getEither(
        () => imageApi.getImages(objectId).then((value) => value.images));
  }

  @override
  Future<Either<Failure, Uint8List>> getImageBytes(String imageId) async {
    var localEither =
        await getEither(() => imageLocalDataSource.getImageBytes(imageId));
    return await localEither.fold(
      (l) async {
        var remoteEither = await getEither(
          () => imageApi.getImageBytes(imageId).then(
                (value) => Uint8List.fromList(value),
              ),
        );
        if (remoteEither.isRight()) {
          var bytes = remoteEither.getOrElse((_) => Uint8List(0));
          imageLocalDataSource.saveImageBytes(imageId, bytes);
        }
        return remoteEither;
      },
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, String>> uploadImage(
      String objectId, File image) async {
    return await getEither(
      () => imageApi.uploadImage(
        objectId,
        [
          MultipartFile.fromFileSync(
            image.path,
            contentType: MediaType('image', image.path.split('.').last),
          )
        ],
      ),
    );
  }
}
