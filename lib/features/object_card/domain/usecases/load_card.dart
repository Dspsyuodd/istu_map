import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/object_card/domain/entities/card_content.dart';
import 'package:istu_map/features/object_card/domain/repositories/object_card_repository.dart';
import 'package:istu_map/features/shared/domain/repositories/image_repository.dart';

class LoadCard extends Usecase<CardContent, LoadCardParams> {
  final ObjectCardRepository objectCardRepository;
  final ImageRepository imageRepository;

  LoadCard(this.objectCardRepository, this.imageRepository);

  @override
  Future<Either<Failure, CardContent>> call(LoadCardParams params) async {
    var cardEither = await objectCardRepository.getObjectCard(params.objectId);
    var images = <Uint8List>[];
    await cardEither.fold(
      (l) async => null,
      (card) async {
        for (var imageId in card.imageIds) {
          var imageEither = await imageRepository.getImageBytes(imageId);
          imageEither.fold((l) => null, (imageBytes) {
            images.add(imageBytes);
          });
        }
      },
    );
    var commentsEither =
        await objectCardRepository.getObjectComments(params.objectId);

    return cardEither.flatMap((card) {
      return commentsEither.map((comments) =>
          CardContent(card: card, comments: comments, images: images));
    });
  }
}

class LoadCardParams extends NoParams {
  final String objectId;

  LoadCardParams({required this.objectId});

  @override
  List<Object?> get props => [objectId];
}
