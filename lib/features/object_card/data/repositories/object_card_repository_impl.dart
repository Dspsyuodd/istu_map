import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/features/object_card/data/datasources/object_cards_api.dart';
import 'package:istu_map/features/object_card/domain/entities/comment.dart';
import 'package:istu_map/features/object_card/domain/entities/object_card.dart';
import 'package:istu_map/features/object_card/domain/repositories/object_card_repository.dart';

class ObjectCardRepositoryImpl extends ExceptionsHandler
    implements ObjectCardRepository {
  final ObjectCardsApi objectCardsApi;
  ObjectCardRepositoryImpl(this.objectCardsApi, super.networkInfo);

  @override
  Future<Either<Failure, String>> createComment(String objectId, String text) {
    return getEither(() => objectCardsApi
        .createComment(objectId, text)
        .then((value) => value.substring(1, value.length - 1)));
  }

  @override
  Future<Either<Failure, void>> deleteComment(
      String objectId, String commentId) {
    return getEither(() => objectCardsApi.deleteComment(objectId, commentId));
  }

  @override
  Future<Either<Failure, ObjectCard>> getObjectCard(String objectId) {
    return getEither(() => objectCardsApi.getObjectCard(objectId));
  }

  @override
  Future<Either<Failure, List<Comment>>> getObjectComments(String objectId) {
    return getEither(() => objectCardsApi.getComments(objectId: objectId));
  }

  @override
  Future<Either<Failure, Comment>> getComment(String commentId) {
    return getEither(() =>
        objectCardsApi.getComments(commentId: commentId).then((e) => e.first));
  }
}
