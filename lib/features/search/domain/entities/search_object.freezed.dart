// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchObject _$SearchObjectFromJson(Map<String, dynamic> json) {
  return _SearchObject.fromJson(json);
}

/// @nodoc
mixin _$SearchObject {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchObjectCopyWith<SearchObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchObjectCopyWith<$Res> {
  factory $SearchObjectCopyWith(
          SearchObject value, $Res Function(SearchObject) then) =
      _$SearchObjectCopyWithImpl<$Res, SearchObject>;
  @useResult
  $Res call({String id, String title, int type});
}

/// @nodoc
class _$SearchObjectCopyWithImpl<$Res, $Val extends SearchObject>
    implements $SearchObjectCopyWith<$Res> {
  _$SearchObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchObjectImplCopyWith<$Res>
    implements $SearchObjectCopyWith<$Res> {
  factory _$$SearchObjectImplCopyWith(
          _$SearchObjectImpl value, $Res Function(_$SearchObjectImpl) then) =
      __$$SearchObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, int type});
}

/// @nodoc
class __$$SearchObjectImplCopyWithImpl<$Res>
    extends _$SearchObjectCopyWithImpl<$Res, _$SearchObjectImpl>
    implements _$$SearchObjectImplCopyWith<$Res> {
  __$$SearchObjectImplCopyWithImpl(
      _$SearchObjectImpl _value, $Res Function(_$SearchObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
  }) {
    return _then(_$SearchObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchObjectImpl implements _SearchObject {
  const _$SearchObjectImpl(
      {required this.id, required this.title, required this.type});

  factory _$SearchObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final int type;

  @override
  String toString() {
    return 'SearchObject(id: $id, title: $title, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchObjectImplCopyWith<_$SearchObjectImpl> get copyWith =>
      __$$SearchObjectImplCopyWithImpl<_$SearchObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchObjectImplToJson(
      this,
    );
  }
}

abstract class _SearchObject implements SearchObject {
  const factory _SearchObject(
      {required final String id,
      required final String title,
      required final int type}) = _$SearchObjectImpl;

  factory _SearchObject.fromJson(Map<String, dynamic> json) =
      _$SearchObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  int get type;
  @override
  @JsonKey(ignore: true)
  _$$SearchObjectImplCopyWith<_$SearchObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
