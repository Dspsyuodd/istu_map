// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) {
  return _ImageDto.fromJson(json);
}

/// @nodoc
mixin _$ImageDto {
  String get id => throw _privateConstructorUsedError;
  String get objectId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDtoCopyWith<ImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDtoCopyWith<$Res> {
  factory $ImageDtoCopyWith(ImageDto value, $Res Function(ImageDto) then) =
      _$ImageDtoCopyWithImpl<$Res, ImageDto>;
  @useResult
  $Res call({String id, String objectId, String title});
}

/// @nodoc
class _$ImageDtoCopyWithImpl<$Res, $Val extends ImageDto>
    implements $ImageDtoCopyWith<$Res> {
  _$ImageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? objectId = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageDtoImplCopyWith<$Res>
    implements $ImageDtoCopyWith<$Res> {
  factory _$$ImageDtoImplCopyWith(
          _$ImageDtoImpl value, $Res Function(_$ImageDtoImpl) then) =
      __$$ImageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String objectId, String title});
}

/// @nodoc
class __$$ImageDtoImplCopyWithImpl<$Res>
    extends _$ImageDtoCopyWithImpl<$Res, _$ImageDtoImpl>
    implements _$$ImageDtoImplCopyWith<$Res> {
  __$$ImageDtoImplCopyWithImpl(
      _$ImageDtoImpl _value, $Res Function(_$ImageDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? objectId = null,
    Object? title = null,
  }) {
    return _then(_$ImageDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageDtoImpl implements _ImageDto {
  const _$ImageDtoImpl(
      {required this.id, required this.objectId, required this.title});

  factory _$ImageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String objectId;
  @override
  final String title;

  @override
  String toString() {
    return 'ImageDto(id: $id, objectId: $objectId, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, objectId, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageDtoImplCopyWith<_$ImageDtoImpl> get copyWith =>
      __$$ImageDtoImplCopyWithImpl<_$ImageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageDtoImplToJson(
      this,
    );
  }
}

abstract class _ImageDto implements ImageDto {
  const factory _ImageDto(
      {required final String id,
      required final String objectId,
      required final String title}) = _$ImageDtoImpl;

  factory _ImageDto.fromJson(Map<String, dynamic> json) =
      _$ImageDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get objectId;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$ImageDtoImplCopyWith<_$ImageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetImagesResult _$GetImagesResultFromJson(Map<String, dynamic> json) {
  return _GetImagesResult.fromJson(json);
}

/// @nodoc
mixin _$GetImagesResult {
  List<ImageDto> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetImagesResultCopyWith<GetImagesResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetImagesResultCopyWith<$Res> {
  factory $GetImagesResultCopyWith(
          GetImagesResult value, $Res Function(GetImagesResult) then) =
      _$GetImagesResultCopyWithImpl<$Res, GetImagesResult>;
  @useResult
  $Res call({List<ImageDto> images});
}

/// @nodoc
class _$GetImagesResultCopyWithImpl<$Res, $Val extends GetImagesResult>
    implements $GetImagesResultCopyWith<$Res> {
  _$GetImagesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetImagesResultImplCopyWith<$Res>
    implements $GetImagesResultCopyWith<$Res> {
  factory _$$GetImagesResultImplCopyWith(_$GetImagesResultImpl value,
          $Res Function(_$GetImagesResultImpl) then) =
      __$$GetImagesResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ImageDto> images});
}

/// @nodoc
class __$$GetImagesResultImplCopyWithImpl<$Res>
    extends _$GetImagesResultCopyWithImpl<$Res, _$GetImagesResultImpl>
    implements _$$GetImagesResultImplCopyWith<$Res> {
  __$$GetImagesResultImplCopyWithImpl(
      _$GetImagesResultImpl _value, $Res Function(_$GetImagesResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$GetImagesResultImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetImagesResultImpl implements _GetImagesResult {
  const _$GetImagesResultImpl({required final List<ImageDto> images})
      : _images = images;

  factory _$GetImagesResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetImagesResultImplFromJson(json);

  final List<ImageDto> _images;
  @override
  List<ImageDto> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'GetImagesResult(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetImagesResultImpl &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetImagesResultImplCopyWith<_$GetImagesResultImpl> get copyWith =>
      __$$GetImagesResultImplCopyWithImpl<_$GetImagesResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetImagesResultImplToJson(
      this,
    );
  }
}

abstract class _GetImagesResult implements GetImagesResult {
  const factory _GetImagesResult({required final List<ImageDto> images}) =
      _$GetImagesResultImpl;

  factory _GetImagesResult.fromJson(Map<String, dynamic> json) =
      _$GetImagesResultImpl.fromJson;

  @override
  List<ImageDto> get images;
  @override
  @JsonKey(ignore: true)
  _$$GetImagesResultImplCopyWith<_$GetImagesResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
