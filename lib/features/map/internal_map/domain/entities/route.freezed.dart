// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteFloor _$RouteFloorFromJson(Map<String, dynamic> json) {
  return _RouteFloor.fromJson(json);
}

/// @nodoc
mixin _$RouteFloor {
  List<Waypoint> get route => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteFloorCopyWith<RouteFloor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteFloorCopyWith<$Res> {
  factory $RouteFloorCopyWith(
          RouteFloor value, $Res Function(RouteFloor) then) =
      _$RouteFloorCopyWithImpl<$Res, RouteFloor>;
  @useResult
  $Res call({List<Waypoint> route});
}

/// @nodoc
class _$RouteFloorCopyWithImpl<$Res, $Val extends RouteFloor>
    implements $RouteFloorCopyWith<$Res> {
  _$RouteFloorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<Waypoint>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteFloorImplCopyWith<$Res>
    implements $RouteFloorCopyWith<$Res> {
  factory _$$RouteFloorImplCopyWith(
          _$RouteFloorImpl value, $Res Function(_$RouteFloorImpl) then) =
      __$$RouteFloorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Waypoint> route});
}

/// @nodoc
class __$$RouteFloorImplCopyWithImpl<$Res>
    extends _$RouteFloorCopyWithImpl<$Res, _$RouteFloorImpl>
    implements _$$RouteFloorImplCopyWith<$Res> {
  __$$RouteFloorImplCopyWithImpl(
      _$RouteFloorImpl _value, $Res Function(_$RouteFloorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_$RouteFloorImpl(
      route: null == route
          ? _value._route
          : route // ignore: cast_nullable_to_non_nullable
              as List<Waypoint>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteFloorImpl implements _RouteFloor {
  const _$RouteFloorImpl({required final List<Waypoint> route})
      : _route = route;

  factory _$RouteFloorImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteFloorImplFromJson(json);

  final List<Waypoint> _route;
  @override
  List<Waypoint> get route {
    if (_route is EqualUnmodifiableListView) return _route;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_route);
  }

  @override
  String toString() {
    return 'RouteFloor(route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteFloorImpl &&
            const DeepCollectionEquality().equals(other._route, _route));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_route));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteFloorImplCopyWith<_$RouteFloorImpl> get copyWith =>
      __$$RouteFloorImplCopyWithImpl<_$RouteFloorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteFloorImplToJson(
      this,
    );
  }
}

abstract class _RouteFloor implements RouteFloor {
  const factory _RouteFloor({required final List<Waypoint> route}) =
      _$RouteFloorImpl;

  factory _RouteFloor.fromJson(Map<String, dynamic> json) =
      _$RouteFloorImpl.fromJson;

  @override
  List<Waypoint> get route;
  @override
  @JsonKey(ignore: true)
  _$$RouteFloorImplCopyWith<_$RouteFloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
