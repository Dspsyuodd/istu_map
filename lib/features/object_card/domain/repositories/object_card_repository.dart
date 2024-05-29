import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/object_card/domain/entities/comment.dart';
import 'package:istu_map/features/object_card/domain/entities/object_card.dart';

abstract class ObjectCardRepository {
  Future<Either<Failure, ObjectCard>> getObjectCard(String objectId);
  Future<Either<Failure, void>> deleteComment(
      String objectId, String commentId);
  Future<Either<Failure, String>> createComment(String objectId, String text);
  Future<Either<Failure, List<Comment>>> getObjectComments(String objectId);
  Future<Either<Failure, Comment>> getComment(String commentId);
}
