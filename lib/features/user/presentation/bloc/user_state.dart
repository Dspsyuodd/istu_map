part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.success(User user, List<Lesson> shedule, Lesson? selectedLesson) = _Success;
  const factory UserState.loading() = _Loading;
  const factory UserState.failure() = _Failure;
}
