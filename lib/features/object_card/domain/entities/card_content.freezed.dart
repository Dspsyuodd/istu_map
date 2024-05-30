// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CardContent {
  ObjectCard get card => throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;
  List<Uint8List>? get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardContentCopyWith<CardContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardContentCopyWith<$Res> {
  factory $CardContentCopyWith(
          CardContent value, $Res Function(CardContent) then) =
      _$CardContentCopyWithImpl<$Res, CardContent>;
  @useResult
  $Res call({ObjectCard card, List<Comment> comments, List<Uint8List>? images});

  $ObjectCardCopyWith<$Res> get card;
}

/// @nodoc
class _$CardContentCopyWithImpl<$Res, $Val extends CardContent>
    implements $CardContentCopyWith<$Res> {
  _$CardContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? comments = null,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as ObjectCard,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ObjectCardCopyWith<$Res> get card {
    return $ObjectCardCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardContentImplCopyWith<$Res>
    implements $CardContentCopyWith<$Res> {
  factory _$$CardContentImplCopyWith(
          _$CardContentImpl value, $Res Function(_$CardContentImpl) then) =
      __$$CardContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ObjectCard card, List<Comment> comments, List<Uint8List>? images});

  @override
  $ObjectCardCopyWith<$Res> get card;
}

/// @nodoc
class __$$CardContentImplCopyWithImpl<$Res>
    extends _$CardContentCopyWithImpl<$Res, _$CardContentImpl>
    implements _$$CardContentImplCopyWith<$Res> {
  __$$CardContentImplCopyWithImpl(
      _$CardContentImpl _value, $Res Function(_$CardContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? comments = null,
    Object? images = freezed,
  }) {
    return _then(_$CardContentImpl(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as ObjectCard,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>?,
    ));
  }
}

/// @nodoc

class _$CardContentImpl implements _CardContent {
  const _$CardContentImpl(
      {required this.card,
      required final List<Comment> comments,
      final List<Uint8List>? images})
      : _comments = comments,
        _images = images;

  @override
  final ObjectCard card;
  final List<Comment> _comments;
  @override
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  final List<Uint8List>? _images;
  @override
  List<Uint8List>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CardContent(card: $card, comments: $comments, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardContentImpl &&
            (identical(other.card, card) || other.card == card) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      card,
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardContentImplCopyWith<_$CardContentImpl> get copyWith =>
      __$$CardContentImplCopyWithImpl<_$CardContentImpl>(this, _$identity);
}

abstract class _CardContent implements CardContent {
  const factory _CardContent(
      {required final ObjectCard card,
      required final List<Comment> comments,
      final List<Uint8List>? images}) = _$CardContentImpl;

  @override
  ObjectCard get card;
  @override
  List<Comment> get comments;
  @override
  List<Uint8List>? get images;
  @override
  @JsonKey(ignore: true)
  _$$CardContentImplCopyWith<_$CardContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
