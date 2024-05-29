// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_floor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InternalRoute _$InternalRouteFromJson(Map<String, dynamic> json) {
  return _InternalRoute.fromJson(json);
}

/// @nodoc
mixin _$InternalRoute {
  String get buildingId => throw _privateConstructorUsedError;
  List<RouteFloor> get floors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InternalRouteCopyWith<InternalRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternalRouteCopyWith<$Res> {
  factory $InternalRouteCopyWith(
          InternalRoute value, $Res Function(InternalRoute) then) =
      _$InternalRouteCopyWithImpl<$Res, InternalRoute>;
  @useResult
  $Res call({String buildingId, List<RouteFloor> floors});
}

/// @nodoc
class _$InternalRouteCopyWithImpl<$Res, $Val extends InternalRoute>
    implements $InternalRouteCopyWith<$Res> {
  _$InternalRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buildingId = null,
    Object? floors = null,
  }) {
    return _then(_value.copyWith(
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String,
      floors: null == floors
          ? _value.floors
          : floors // ignore: cast_nullable_to_non_nullable
              as List<RouteFloor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InternalRouteImplCopyWith<$Res>
    implements $InternalRouteCopyWith<$Res> {
  factory _$$InternalRouteImplCopyWith(
          _$InternalRouteImpl value, $Res Function(_$InternalRouteImpl) then) =
      __$$InternalRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String buildingId, List<RouteFloor> floors});
}

/// @nodoc
class __$$InternalRouteImplCopyWithImpl<$Res>
    extends _$InternalRouteCopyWithImpl<$Res, _$InternalRouteImpl>
    implements _$$InternalRouteImplCopyWith<$Res> {
  __$$InternalRouteImplCopyWithImpl(
      _$InternalRouteImpl _value, $Res Function(_$InternalRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buildingId = null,
    Object? floors = null,
  }) {
    return _then(_$InternalRouteImpl(
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String,
      floors: null == floors
          ? _value._floors
          : floors // ignore: cast_nullable_to_non_nullable
              as List<RouteFloor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InternalRouteImpl implements _InternalRoute {
  const _$InternalRouteImpl(
      {required this.buildingId, required final List<RouteFloor> floors})
      : _floors = floors;

  factory _$InternalRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$InternalRouteImplFromJson(json);

  @override
  final String buildingId;
  final List<RouteFloor> _floors;
  @override
  List<RouteFloor> get floors {
    if (_floors is EqualUnmodifiableListView) return _floors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_floors);
  }

  @override
  String toString() {
    return 'InternalRoute(buildingId: $buildingId, floors: $floors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalRouteImpl &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId) &&
            const DeepCollectionEquality().equals(other._floors, _floors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, buildingId, const DeepCollectionEquality().hash(_floors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternalRouteImplCopyWith<_$InternalRouteImpl> get copyWith =>
      __$$InternalRouteImplCopyWithImpl<_$InternalRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InternalRouteImplToJson(
      this,
    );
  }
}

abstract class _InternalRoute implements InternalRoute {
  const factory _InternalRoute(
      {required final String buildingId,
      required final List<RouteFloor> floors}) = _$InternalRouteImpl;

  factory _InternalRoute.fromJson(Map<String, dynamic> json) =
      _$InternalRouteImpl.fromJson;

  @override
  String get buildingId;
  @override
  List<RouteFloor> get floors;
  @override
  @JsonKey(ignore: true)
  _$$InternalRouteImplCopyWith<_$InternalRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
