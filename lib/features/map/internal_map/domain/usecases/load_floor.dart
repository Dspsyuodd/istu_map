import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/floor.dart';
import 'package:istu_map/features/map/internal_map/domain/repositories/floor_repository.dart';
import 'package:istu_map/features/shared/domain/repositories/image_repository.dart';

class LoadFloor extends Usecase<(Floor, Uint8List), FloorLoadParams> {
  final FloorRepository _floorRepository;
  final ImageRepository _imageRepository;

  LoadFloor(this._floorRepository, this._imageRepository);

  @override
  Future<Either<Failure, (Floor, Uint8List)>> call(
      FloorLoadParams params) async {
    var floorEither =
        await _floorRepository.getFloor(params.buildingId, params.floorNumber);
    var images = await _imageRepository.getImages(params.floorId);
    var imageTask = images.bindFuture((imagesDto) async {
      var image = await _imageRepository.getImageBytes(imagesDto.first.id);
      return image;
    });
    var image = await imageTask.run();
    return floorEither.flatMap((floor) {
      return image.map((imageBytes) {
        return (floor, imageBytes);
      });
    });
  }
}

class FloorLoadParams extends NoParams {
  final String buildingId;
  final String floorId;
  final int floorNumber;

  FloorLoadParams({
    required this.buildingId,
    required this.floorId,
    required this.floorNumber,
  });
  @override
  List<Object?> get props => [buildingId, floorId, floorNumber];
}
