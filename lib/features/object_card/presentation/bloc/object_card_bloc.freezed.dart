// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'object_card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ObjectCardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String objectId) cardOpened,
    required TResult Function(String text) commentCreated,
    required TResult Function(String text) commentDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String objectId)? cardOpened,
    TResult? Function(String text)? commentCreated,
    TResult? Function(String text)? commentDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String objectId)? cardOpened,
    TResult Function(String text)? commentCreated,
    TResult Function(String text)? commentDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardOpened value) cardOpened,
    required TResult Function(_CommentCreated value) commentCreated,
    required TResult Function(_CommentDeleted value) commentDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardOpened value)? cardOpened,
    TResult? Function(_CommentCreated value)? commentCreated,
    TResult? Function(_CommentDeleted value)? commentDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardOpened value)? cardOpened,
    TResult Function(_CommentCreated value)? commentCreated,
    TResult Function(_CommentDeleted value)? commentDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectCardEventCopyWith<$Res> {
  factory $ObjectCardEventCopyWith(
          ObjectCardEvent value, $Res Function(ObjectCardEvent) then) =
      _$ObjectCardEventCopyWithImpl<$Res, ObjectCardEvent>;
}

/// @nodoc
class _$ObjectCardEventCopyWithImpl<$Res, $Val extends ObjectCardEvent>
    implements $ObjectCardEventCopyWith<$Res> {
  _$ObjectCardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ObjectCardEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ObjectCardEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String objectId) cardOpened,
    required TResult Function(String text) commentCreated,
    required TResult Function(String text) commentDeleted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String objectId)? cardOpened,
    TResult? Function(String text)? commentCreated,
    TResult? Function(String text)? commentDeleted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String objectId)? cardOpened,
    TResult Function(String text)? commentCreated,
    TResult Function(String text)? commentDeleted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardOpened value) cardOpened,
    required TResult Function(_CommentCreated value) commentCreated,
    required TResult Function(_CommentDeleted value) commentDeleted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardOpened value)? cardOpened,
    TResult? Function(_CommentCreated value)? commentCreated,
    TResult? Function(_CommentDeleted value)? commentDeleted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardOpened value)? cardOpened,
    TResult Function(_CommentCreated value)? commentCreated,
    TResult Function(_CommentDeleted value)? commentDeleted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ObjectCardEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CardOpenedImplCopyWith<$Res> {
  factory _$$CardOpenedImplCopyWith(
          _$CardOpenedImpl value, $Res Function(_$CardOpenedImpl) then) =
      __$$CardOpenedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String objectId});
}

/// @nodoc
class __$$CardOpenedImplCopyWithImpl<$Res>
    extends _$ObjectCardEventCopyWithImpl<$Res, _$CardOpenedImpl>
    implements _$$CardOpenedImplCopyWith<$Res> {
  __$$CardOpenedImplCopyWithImpl(
      _$CardOpenedImpl _value, $Res Function(_$CardOpenedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
  }) {
    return _then(_$CardOpenedImpl(
      null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CardOpenedImpl implements _CardOpened {
  const _$CardOpenedImpl(this.objectId);

  @override
  final String objectId;

  @override
  String toString() {
    return 'ObjectCardEvent.cardOpened(objectId: $objectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardOpenedImpl &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, objectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardOpenedImplCopyWith<_$CardOpenedImpl> get copyWith =>
      __$$CardOpenedImplCopyWithImpl<_$CardOpenedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String objectId) cardOpened,
    required TResult Function(String text) commentCreated,
    required TResult Function(String text) commentDeleted,
  }) {
    return cardOpened(objectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String objectId)? cardOpened,
    TResult? Function(String text)? commentCreated,
    TResult? Function(String text)? commentDeleted,
  }) {
    return cardOpened?.call(objectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String objectId)? cardOpened,
    TResult Function(String text)? commentCreated,
    TResult Function(String text)? commentDeleted,
    required TResult orElse(),
  }) {
    if (cardOpened != null) {
      return cardOpened(objectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardOpened value) cardOpened,
    required TResult Function(_CommentCreated value) commentCreated,
    required TResult Function(_CommentDeleted value) commentDeleted,
  }) {
    return cardOpened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardOpened value)? cardOpened,
    TResult? Function(_CommentCreated value)? commentCreated,
    TResult? Function(_CommentDeleted value)? commentDeleted,
  }) {
    return cardOpened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardOpened value)? cardOpened,
    TResult Function(_CommentCreated value)? commentCreated,
    TResult Function(_CommentDeleted value)? commentDeleted,
    required TResult orElse(),
  }) {
    if (cardOpened != null) {
      return cardOpened(this);
    }
    return orElse();
  }
}

abstract class _CardOpened implements ObjectCardEvent {
  const factory _CardOpened(final String objectId) = _$CardOpenedImpl;

  String get objectId;
  @JsonKey(ignore: true)
  _$$CardOpenedImplCopyWith<_$CardOpenedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommentCreatedImplCopyWith<$Res> {
  factory _$$CommentCreatedImplCopyWith(_$CommentCreatedImpl value,
          $Res Function(_$CommentCreatedImpl) then) =
      __$$CommentCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$CommentCreatedImplCopyWithImpl<$Res>
    extends _$ObjectCardEventCopyWithImpl<$Res, _$CommentCreatedImpl>
    implements _$$CommentCreatedImplCopyWith<$Res> {
  __$$CommentCreatedImplCopyWithImpl(
      _$CommentCreatedImpl _value, $Res Function(_$CommentCreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$CommentCreatedImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CommentCreatedImpl implements _CommentCreated {
  const _$CommentCreatedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'ObjectCardEvent.commentCreated(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentCreatedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentCreatedImplCopyWith<_$CommentCreatedImpl> get copyWith =>
      __$$CommentCreatedImplCopyWithImpl<_$CommentCreatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String objectId) cardOpened,
    required TResult Function(String text) commentCreated,
    required TResult Function(String text) commentDeleted,
  }) {
    return commentCreated(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String objectId)? cardOpened,
    TResult? Function(String text)? commentCreated,
    TResult? Function(String text)? commentDeleted,
  }) {
    return commentCreated?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String objectId)? cardOpened,
    TResult Function(String text)? commentCreated,
    TResult Function(String text)? commentDeleted,
    required TResult orElse(),
  }) {
    if (commentCreated != null) {
      return commentCreated(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardOpened value) cardOpened,
    required TResult Function(_CommentCreated value) commentCreated,
    required TResult Function(_CommentDeleted value) commentDeleted,
  }) {
    return commentCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardOpened value)? cardOpened,
    TResult? Function(_CommentCreated value)? commentCreated,
    TResult? Function(_CommentDeleted value)? commentDeleted,
  }) {
    return commentCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardOpened value)? cardOpened,
    TResult Function(_CommentCreated value)? commentCreated,
    TResult Function(_CommentDeleted value)? commentDeleted,
    required TResult orElse(),
  }) {
    if (commentCreated != null) {
      return commentCreated(this);
    }
    return orElse();
  }
}

abstract class _CommentCreated implements ObjectCardEvent {
  const factory _CommentCreated(final String text) = _$CommentCreatedImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$CommentCreatedImplCopyWith<_$CommentCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommentDeletedImplCopyWith<$Res> {
  factory _$$CommentDeletedImplCopyWith(_$CommentDeletedImpl value,
          $Res Function(_$CommentDeletedImpl) then) =
      __$$CommentDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$CommentDeletedImplCopyWithImpl<$Res>
    extends _$ObjectCardEventCopyWithImpl<$Res, _$CommentDeletedImpl>
    implements _$$CommentDeletedImplCopyWith<$Res> {
  __$$CommentDeletedImplCopyWithImpl(
      _$CommentDeletedImpl _value, $Res Function(_$CommentDeletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$CommentDeletedImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CommentDeletedImpl implements _CommentDeleted {
  const _$CommentDeletedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'ObjectCardEvent.commentDeleted(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentDeletedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentDeletedImplCopyWith<_$CommentDeletedImpl> get copyWith =>
      __$$CommentDeletedImplCopyWithImpl<_$CommentDeletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String objectId) cardOpened,
    required TResult Function(String text) commentCreated,
    required TResult Function(String text) commentDeleted,
  }) {
    return commentDeleted(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String objectId)? cardOpened,
    TResult? Function(String text)? commentCreated,
    TResult? Function(String text)? commentDeleted,
  }) {
    return commentDeleted?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String objectId)? cardOpened,
    TResult Function(String text)? commentCreated,
    TResult Function(String text)? commentDeleted,
    required TResult orElse(),
  }) {
    if (commentDeleted != null) {
      return commentDeleted(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardOpened value) cardOpened,
    required TResult Function(_CommentCreated value) commentCreated,
    required TResult Function(_CommentDeleted value) commentDeleted,
  }) {
    return commentDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardOpened value)? cardOpened,
    TResult? Function(_CommentCreated value)? commentCreated,
    TResult? Function(_CommentDeleted value)? commentDeleted,
  }) {
    return commentDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardOpened value)? cardOpened,
    TResult Function(_CommentCreated value)? commentCreated,
    TResult Function(_CommentDeleted value)? commentDeleted,
    required TResult orElse(),
  }) {
    if (commentDeleted != null) {
      return commentDeleted(this);
    }
    return orElse();
  }
}

abstract class _CommentDeleted implements ObjectCardEvent {
  const factory _CommentDeleted(final String text) = _$CommentDeletedImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$CommentDeletedImplCopyWith<_$CommentDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ObjectCardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CardContent cardContent) success,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CardContent cardContent)? success,
    TResult? Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CardContent cardContent)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectCardStateCopyWith<$Res> {
  factory $ObjectCardStateCopyWith(
          ObjectCardState value, $Res Function(ObjectCardState) then) =
      _$ObjectCardStateCopyWithImpl<$Res, ObjectCardState>;
}

/// @nodoc
class _$ObjectCardStateCopyWithImpl<$Res, $Val extends ObjectCardState>
    implements $ObjectCardStateCopyWith<$Res> {
  _$ObjectCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ObjectCardStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ObjectCardState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CardContent cardContent) success,
    required TResult Function() failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CardContent cardContent)? success,
    TResult? Function()? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CardContent cardContent)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ObjectCardState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ObjectCardStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ObjectCardState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CardContent cardContent) success,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CardContent cardContent)? success,
    TResult? Function()? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CardContent cardContent)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ObjectCardState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CardContent cardContent});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ObjectCardStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardContent = null,
  }) {
    return _then(_$SuccessImpl(
      null == cardContent
          ? _value.cardContent
          : cardContent // ignore: cast_nullable_to_non_nullable
              as CardContent,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.cardContent);

  @override
  final CardContent cardContent;

  @override
  String toString() {
    return 'ObjectCardState.success(cardContent: $cardContent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.cardContent, cardContent) ||
                other.cardContent == cardContent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CardContent cardContent) success,
    required TResult Function() failure,
  }) {
    return success(cardContent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CardContent cardContent)? success,
    TResult? Function()? failure,
  }) {
    return success?.call(cardContent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CardContent cardContent)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(cardContent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ObjectCardState {
  const factory _Success(final CardContent cardContent) = _$SuccessImpl;

  CardContent get cardContent;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ObjectCardStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl();

  @override
  String toString() {
    return 'ObjectCardState.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CardContent cardContent) success,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CardContent cardContent)? success,
    TResult? Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CardContent cardContent)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ObjectCardState {
  const factory _Failure() = _$FailureImpl;
}
