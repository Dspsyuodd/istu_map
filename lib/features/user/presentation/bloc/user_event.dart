part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
  const factory UserEvent.getUserData() = _GetUser;
  const factory UserEvent.selectLesson(Lesson lesson) = _SelectLesson;
}
