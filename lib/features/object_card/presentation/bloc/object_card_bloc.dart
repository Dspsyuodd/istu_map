import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/object_card/domain/entities/card_content.dart';
import 'package:istu_map/features/object_card/domain/usecases/create_comment.dart';
import 'package:istu_map/features/object_card/domain/usecases/delete_comment.dart';
import 'package:istu_map/features/object_card/domain/usecases/load_card.dart';

part 'object_card_event.dart';
part 'object_card_state.dart';
part 'object_card_bloc.freezed.dart';

class ObjectCardBloc extends Bloc<ObjectCardEvent, ObjectCardState> {
  final CreateComment createComment;
  final LoadCard loadCard;
  final DeleteComment deleteComment;

  CardContent? _card;

  ObjectCardBloc(this.createComment, this.loadCard, this.deleteComment)
      : super(const _Initial()) {
    on<ObjectCardEvent>((event, emit) async {
      await event.when(
        started: () {},
        cardOpened: (objectId) async {
          emit(const ObjectCardState.loading());
          var result = await loadCard(LoadCardParams(objectId: objectId));
          result.fold(
            (l) => _emitError(l, emit),
            (r) {
              emit(ObjectCardState.success(r));
            },
          );
        },
        commentCreated: (commentText) async {
          var result = await createComment(CreateCommentParams(
            objectId: _card!.card.objectId,
            text: commentText,
          ));
          result.fold(
            (l) => _emitError(l, emit),
            (comment) {
              _card!.comments.add(comment);
              emit(ObjectCardState.success(_card!));
            },
          );
        },
        commentDeleted: (commentId) async {
          var result = await deleteComment(DeleteCommentParams(
            objectId: _card!.card.objectId,
            commentId: commentId,
          ));
          result.fold(
            (l) => _emitError(l, emit),
            (_) {
              _card!.comments.removeWhere((comment) => comment.id == commentId);
              emit(ObjectCardState.success(_card!));
            },
          );
        },
      );
    });
  }

  void _emitError(Failure l, Emitter<ObjectCardState> emit) {
    if (l is UnknownFailure) {
      log(l.message);
      log(l.stackTrace);
    }
    if (l is ServerFailure) {
      log(l.message);
    }
  }
}
