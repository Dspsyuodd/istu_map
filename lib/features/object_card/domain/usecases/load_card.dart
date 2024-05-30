import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/object_card/domain/entities/comment.dart';
import 'package:istu_map/features/object_card/domain/entities/object_card.dart';
import 'package:istu_map/features/object_card/domain/repositories/object_card_repository.dart';
import 'package:istu_map/features/shared/domain/repositories/image_repository.dart';

class LoadCard extends Usecase<
    (ObjectCard, List<Comment>, Task<List<Uint8List>>), LoadCardParams> {
  final ObjectCardRepository objectCardRepository;
  final ImageRepository imageRepository;

  LoadCard(this.objectCardRepository, this.imageRepository);

  @override
  Future<Either<Failure, (ObjectCard, List<Comment>, Task<List<Uint8List>>)>>
      call(LoadCardParams params) async {
    var cardEither = await objectCardRepository.getObjectCard(params.objectId);

    var imagesTask = cardEither.fold(
      (l) => null,
      (card) {
        return Task(() async {
          var images = <Uint8List>[];
          for (var imageId in card.imageIds) {
            var imageEither = await imageRepository.getImageBytes(imageId);
            imageEither.fold((l) => null, (imageBytes) {
              images.add(imageBytes);
            });
          }
          return images;
        });
      },
    );

    var commentsEither =
        await objectCardRepository.getObjectComments(params.objectId);

    return cardEither.flatMap((card) {
      return commentsEither.map((comments) =>
          (card, comments, imagesTask!));
    });
  }
}

class LoadCardParams extends NoParams {
  final String objectId;

  LoadCardParams({required this.objectId});

  @override
  List<Object?> get props => [objectId];
}
