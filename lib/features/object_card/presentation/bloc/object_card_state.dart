part of 'object_card_bloc.dart';

@freezed
class ObjectCardState with _$ObjectCardState {
  const factory ObjectCardState.initial() = _Initial;
  const factory ObjectCardState.loading() = _Loading;
  const factory ObjectCardState.success(
      CardContent cardContent) = _Success;
  const factory ObjectCardState.failure() = _Failure;
}
