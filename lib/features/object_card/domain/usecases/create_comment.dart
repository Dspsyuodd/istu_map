import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/object_card/domain/entities/comment.dart';
import 'package:istu_map/features/object_card/domain/repositories/object_card_repository.dart';

class CreateComment extends Usecase<Comment, CreateCommentParams> {
  final ObjectCardRepository repository;

  CreateComment(this.repository);
  @override
  Future<Either<Failure, Comment>> call(CreateCommentParams params) async {
    var commentIdEither =
        await repository.createComment(params.objectId, params.text);
    return await commentIdEither.fold(
      (l) async => Left(l),
      (commentId) async {
        var commentEither = await repository.getComment(commentId);
        return commentEither.fold(
          (l) => Left(l),
          (comment) => Right(comment),
        );
      },
    );
  }
}

class CreateCommentParams extends NoParams {
  final String objectId;
  final String text;

  CreateCommentParams({required this.objectId, required this.text});

  @override
  List<Object?> get props => [objectId, text];
}
