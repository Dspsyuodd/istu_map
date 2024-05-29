// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'object_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ObjectCard _$ObjectCardFromJson(Map<String, dynamic> json) {
  return _ObjectCard.fromJson(json);
}

/// @nodoc
mixin _$ObjectCard {
  String get objectId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get contentType => throw _privateConstructorUsedError;
  List<String> get imageIds => throw _privateConstructorUsedError;
  dynamic get required => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObjectCardCopyWith<ObjectCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectCardCopyWith<$Res> {
  factory $ObjectCardCopyWith(
          ObjectCard value, $Res Function(ObjectCard) then) =
      _$ObjectCardCopyWithImpl<$Res, ObjectCard>;
  @useResult
  $Res call(
      {String objectId,
      String title,
      String? description,
      String address,
      int contentType,
      List<String> imageIds,
      dynamic required});
}

/// @nodoc
class _$ObjectCardCopyWithImpl<$Res, $Val extends ObjectCard>
    implements $ObjectCardCopyWith<$Res> {
  _$ObjectCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? title = null,
    Object? description = freezed,
    Object? address = null,
    Object? contentType = null,
    Object? imageIds = null,
    Object? required = freezed,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as int,
      imageIds: null == imageIds
          ? _value.imageIds
          : imageIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObjectCardImplCopyWith<$Res>
    implements $ObjectCardCopyWith<$Res> {
  factory _$$ObjectCardImplCopyWith(
          _$ObjectCardImpl value, $Res Function(_$ObjectCardImpl) then) =
      __$$ObjectCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String objectId,
      String title,
      String? description,
      String address,
      int contentType,
      List<String> imageIds,
      dynamic required});
}

/// @nodoc
class __$$ObjectCardImplCopyWithImpl<$Res>
    extends _$ObjectCardCopyWithImpl<$Res, _$ObjectCardImpl>
    implements _$$ObjectCardImplCopyWith<$Res> {
  __$$ObjectCardImplCopyWithImpl(
      _$ObjectCardImpl _value, $Res Function(_$ObjectCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? title = null,
    Object? description = freezed,
    Object? address = null,
    Object? contentType = null,
    Object? imageIds = null,
    Object? required = freezed,
  }) {
    return _then(_$ObjectCardImpl(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as int,
      imageIds: null == imageIds
          ? _value._imageIds
          : imageIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      required: freezed == required ? _value.required! : required,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObjectCardImpl implements _ObjectCard {
  const _$ObjectCardImpl(
      {required this.objectId,
      required this.title,
      required this.description,
      required this.address,
      required this.contentType,
      required final List<String> imageIds,
      this.required})
      : _imageIds = imageIds;

  factory _$ObjectCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObjectCardImplFromJson(json);

  @override
  final String objectId;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String address;
  @override
  final int contentType;
  final List<String> _imageIds;
  @override
  List<String> get imageIds {
    if (_imageIds is EqualUnmodifiableListView) return _imageIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageIds);
  }

  @override
  final dynamic required;

  @override
  String toString() {
    return 'ObjectCard(objectId: $objectId, title: $title, description: $description, address: $address, contentType: $contentType, imageIds: $imageIds, required: $required)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObjectCardImpl &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            const DeepCollectionEquality().equals(other._imageIds, _imageIds) &&
            const DeepCollectionEquality().equals(other.required, required));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      objectId,
      title,
      description,
      address,
      contentType,
      const DeepCollectionEquality().hash(_imageIds),
      const DeepCollectionEquality().hash(required));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObjectCardImplCopyWith<_$ObjectCardImpl> get copyWith =>
      __$$ObjectCardImplCopyWithImpl<_$ObjectCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObjectCardImplToJson(
      this,
    );
  }
}

abstract class _ObjectCard implements ObjectCard {
  const factory _ObjectCard(
      {required final String objectId,
      required final String title,
      required final String? description,
      required final String address,
      required final int contentType,
      required final List<String> imageIds,
      final dynamic required}) = _$ObjectCardImpl;

  factory _ObjectCard.fromJson(Map<String, dynamic> json) =
      _$ObjectCardImpl.fromJson;

  @override
  String get objectId;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get address;
  @override
  int get contentType;
  @override
  List<String> get imageIds;
  @override
  dynamic get required;
  @override
  @JsonKey(ignore: true)
  _$$ObjectCardImplCopyWith<_$ObjectCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
