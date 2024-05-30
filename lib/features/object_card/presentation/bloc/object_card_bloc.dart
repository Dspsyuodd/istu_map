import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/object_card/domain/entities/card_content.dart';
import 'package:istu_map/features/object_card/domain/usecases/add_image.dart';
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
  final AddImage addImage;

  var _cardContent = CardContent.empty();

  ObjectCardBloc(
      this.createComment, this.loadCard, this.deleteComment, this.addImage)
      : super(const _Initial()) {
    on<ObjectCardEvent>((event, emit) async {
      await event.when(
        started: () {},
        cardOpened: (objectId) async {
          emit(const ObjectCardState.loading());
          var result = await loadCard(LoadCardParams(objectId: objectId));
          await result.fold(
            (l) async => _emitError(l, emit),
            (r) async {
              _cardContent = _cardContent.copyWith(card: r.$1, comments: r.$2);
              emit(
                ObjectCardState.loadingSuccess(
                  _cardContent,
                ),
              );
              var images = await r.$3.run();
              _cardContent = _cardContent.copyWith(images: images);
              emit(ObjectCardState.loadingSuccess(_cardContent));
            },
          );
        },
        commentCreated: (commentText) async {
          var result = await createComment(CreateCommentParams(
            objectId: _cardContent.card.objectId,
            text: commentText,
          ));
          result.fold(
            (l) => _emitError(l, emit),
            (comment) {
              _cardContent = _cardContent
                  .copyWith(comments: [..._cardContent.comments, comment]);
              emit(ObjectCardState.loadingSuccess(_cardContent));
            },
          );
        },
        commentDeleted: (commentId) async {
          var result = await deleteComment(DeleteCommentParams(
            objectId: _cardContent.card.objectId,
            commentId: commentId,
          ));
          result.fold(
            (l) => _emitError(l, emit),
            (_) {
              _cardContent.comments
                  .removeWhere((comment) => comment.id == commentId);
              emit(ObjectCardState.loadingSuccess(_cardContent));
            },
          );
        },
        imageAdded: (image) async {
          var result = await addImage(AddImageParams(
              objectId: _cardContent.card.objectId, image: image));
          result.fold((l) => _emitError(l, emit), (r) {
            var imageBytes = image.readAsBytesSync();
            _cardContent = _cardContent
                .copyWith(images: [..._cardContent.images!, imageBytes]);
            emit(ObjectCardState.loadingSuccess(_cardContent));
          });
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
