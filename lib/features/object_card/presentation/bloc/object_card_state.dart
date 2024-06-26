part of 'object_card_bloc.dart';

@freezed
class ObjectCardState with _$ObjectCardState {
  const factory ObjectCardState.initial() = _Initial;
  const factory ObjectCardState.loading() = _Loading;
  const factory ObjectCardState.loadingSuccess(CardContent cardContent) =
      _LoadingSuccess;
  const factory ObjectCardState.failure() = _Failure;
}
