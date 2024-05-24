// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Floor _$FloorFromJson(Map<String, dynamic> json) {
  return _Floor.fromJson(json);
}

/// @nodoc
mixin _$Floor {
  String get buildingId => throw _privateConstructorUsedError;
  String get floorId => throw _privateConstructorUsedError;
  int get floorNumber => throw _privateConstructorUsedError;
  List<Waypoint> get objects => throw _privateConstructorUsedError;
  List<Edge> get edges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FloorCopyWith<Floor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorCopyWith<$Res> {
  factory $FloorCopyWith(Floor value, $Res Function(Floor) then) =
      _$FloorCopyWithImpl<$Res, Floor>;
  @useResult
  $Res call(
      {String buildingId,
      String floorId,
      int floorNumber,
      List<Waypoint> objects,
      List<Edge> edges});
}

/// @nodoc
class _$FloorCopyWithImpl<$Res, $Val extends Floor>
    implements $FloorCopyWith<$Res> {
  _$FloorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buildingId = null,
    Object? floorId = null,
    Object? floorNumber = null,
    Object? objects = null,
    Object? edges = null,
  }) {
    return _then(_value.copyWith(
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String,
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
      floorNumber: null == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int,
      objects: null == objects
          ? _value.objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<Waypoint>,
      edges: null == edges
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<Edge>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloorImplCopyWith<$Res> implements $FloorCopyWith<$Res> {
  factory _$$FloorImplCopyWith(
          _$FloorImpl value, $Res Function(_$FloorImpl) then) =
      __$$FloorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String buildingId,
      String floorId,
      int floorNumber,
      List<Waypoint> objects,
      List<Edge> edges});
}

/// @nodoc
class __$$FloorImplCopyWithImpl<$Res>
    extends _$FloorCopyWithImpl<$Res, _$FloorImpl>
    implements _$$FloorImplCopyWith<$Res> {
  __$$FloorImplCopyWithImpl(
      _$FloorImpl _value, $Res Function(_$FloorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buildingId = null,
    Object? floorId = null,
    Object? floorNumber = null,
    Object? objects = null,
    Object? edges = null,
  }) {
    return _then(_$FloorImpl(
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String,
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
      floorNumber: null == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int,
      objects: null == objects
          ? _value._objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<Waypoint>,
      edges: null == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<Edge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FloorImpl implements _Floor {
  const _$FloorImpl(
      {required this.buildingId,
      required this.floorId,
      required this.floorNumber,
      required final List<Waypoint> objects,
      required final List<Edge> edges})
      : _objects = objects,
        _edges = edges;

  factory _$FloorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FloorImplFromJson(json);

  @override
  final String buildingId;
  @override
  final String floorId;
  @override
  final int floorNumber;
  final List<Waypoint> _objects;
  @override
  List<Waypoint> get objects {
    if (_objects is EqualUnmodifiableListView) return _objects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objects);
  }

  final List<Edge> _edges;
  @override
  List<Edge> get edges {
    if (_edges is EqualUnmodifiableListView) return _edges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_edges);
  }

  @override
  String toString() {
    return 'Floor(buildingId: $buildingId, floorId: $floorId, floorNumber: $floorNumber, objects: $objects, edges: $edges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorImpl &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.floorNumber, floorNumber) ||
                other.floorNumber == floorNumber) &&
            const DeepCollectionEquality().equals(other._objects, _objects) &&
            const DeepCollectionEquality().equals(other._edges, _edges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      buildingId,
      floorId,
      floorNumber,
      const DeepCollectionEquality().hash(_objects),
      const DeepCollectionEquality().hash(_edges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorImplCopyWith<_$FloorImpl> get copyWith =>
      __$$FloorImplCopyWithImpl<_$FloorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloorImplToJson(
      this,
    );
  }
}

abstract class _Floor implements Floor {
  const factory _Floor(
      {required final String buildingId,
      required final String floorId,
      required final int floorNumber,
      required final List<Waypoint> objects,
      required final List<Edge> edges}) = _$FloorImpl;

  factory _Floor.fromJson(Map<String, dynamic> json) = _$FloorImpl.fromJson;

  @override
  String get buildingId;
  @override
  String get floorId;
  @override
  int get floorNumber;
  @override
  List<Waypoint> get objects;
  @override
  List<Edge> get edges;
  @override
  @JsonKey(ignore: true)
  _$$FloorImplCopyWith<_$FloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
