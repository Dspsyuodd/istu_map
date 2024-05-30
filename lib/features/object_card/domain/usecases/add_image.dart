import 'dart:io';

import 'package:fpdart/src/either.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/shared/domain/repositories/image_repository.dart';

class AddImage extends Usecase<String, AddImageParams> {
  final ImageRepository repository;

  AddImage(this.repository);

  @override
  Future<Either<Failure, String>> call(AddImageParams params) async {
    return await repository.uploadImage(params.objectId, params.image);
  }
}

class AddImageParams extends NoParams {
  final String objectId;
  final File image;

  AddImageParams({required this.objectId, required this.image});

  @override
  List<Object?> get props => [image];
}
