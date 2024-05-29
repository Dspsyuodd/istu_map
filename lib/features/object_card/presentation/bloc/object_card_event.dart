part of 'object_card_bloc.dart';

@freezed
class ObjectCardEvent with _$ObjectCardEvent {
  const factory ObjectCardEvent.started() = _Started;
  const factory ObjectCardEvent.cardOpened(String objectId) = _CardOpened;
  const factory ObjectCardEvent.commentCreated(String text) = _CommentCreated;
  const factory ObjectCardEvent.commentDeleted(String text) = _CommentDeleted;
}
