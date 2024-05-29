import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/object_card/domain/repositories/object_card_repository.dart';

class DeleteComment extends Usecase<void, DeleteCommentParams> {
  final ObjectCardRepository repository;

  DeleteComment(this.repository);
  @override
  Future<Either<Failure, void>> call(DeleteCommentParams params) {
    return repository.deleteComment(params.objectId, params.commentId);
  }
}

class DeleteCommentParams extends NoParams {
  final String objectId;
  final String commentId;

  DeleteCommentParams({required this.objectId, required this.commentId});

  @override
  List<Object?> get props => [objectId, commentId];
}
