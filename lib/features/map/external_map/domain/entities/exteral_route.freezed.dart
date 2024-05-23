// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exteral_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExternalRoute _$ExternalRouteFromJson(Map<String, dynamic> json) {
  return _ExternalRoute.fromJson(json);
}

/// @nodoc
mixin _$ExternalRoute {
  @DateTimeJsonConverter()
  DateTime get totalTime => throw _privateConstructorUsedError;
  @LatLngJsonConverter()
  List<LatLng> get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExternalRouteCopyWith<ExternalRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalRouteCopyWith<$Res> {
  factory $ExternalRouteCopyWith(
          ExternalRoute value, $Res Function(ExternalRoute) then) =
      _$ExternalRouteCopyWithImpl<$Res, ExternalRoute>;
  @useResult
  $Res call(
      {@DateTimeJsonConverter() DateTime totalTime,
      @LatLngJsonConverter() List<LatLng> points});
}

/// @nodoc
class _$ExternalRouteCopyWithImpl<$Res, $Val extends ExternalRoute>
    implements $ExternalRouteCopyWith<$Res> {
  _$ExternalRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTime = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExternalRouteImplCopyWith<$Res>
    implements $ExternalRouteCopyWith<$Res> {
  factory _$$ExternalRouteImplCopyWith(
          _$ExternalRouteImpl value, $Res Function(_$ExternalRouteImpl) then) =
      __$$ExternalRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateTimeJsonConverter() DateTime totalTime,
      @LatLngJsonConverter() List<LatLng> points});
}

/// @nodoc
class __$$ExternalRouteImplCopyWithImpl<$Res>
    extends _$ExternalRouteCopyWithImpl<$Res, _$ExternalRouteImpl>
    implements _$$ExternalRouteImplCopyWith<$Res> {
  __$$ExternalRouteImplCopyWithImpl(
      _$ExternalRouteImpl _value, $Res Function(_$ExternalRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTime = null,
    Object? points = null,
  }) {
    return _then(_$ExternalRouteImpl(
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExternalRouteImpl implements _ExternalRoute {
  const _$ExternalRouteImpl(
      {@DateTimeJsonConverter() required this.totalTime,
      @LatLngJsonConverter() required final List<LatLng> points})
      : _points = points;

  factory _$ExternalRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExternalRouteImplFromJson(json);

  @override
  @DateTimeJsonConverter()
  final DateTime totalTime;
  final List<LatLng> _points;
  @override
  @LatLngJsonConverter()
  List<LatLng> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'ExternalRoute(totalTime: $totalTime, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExternalRouteImpl &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalTime, const DeepCollectionEquality().hash(_points));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExternalRouteImplCopyWith<_$ExternalRouteImpl> get copyWith =>
      __$$ExternalRouteImplCopyWithImpl<_$ExternalRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExternalRouteImplToJson(
      this,
    );
  }
}

abstract class _ExternalRoute implements ExternalRoute {
  const factory _ExternalRoute(
          {@DateTimeJsonConverter() required final DateTime totalTime,
          @LatLngJsonConverter() required final List<LatLng> points}) =
      _$ExternalRouteImpl;

  factory _ExternalRoute.fromJson(Map<String, dynamic> json) =
      _$ExternalRouteImpl.fromJson;

  @override
  @DateTimeJsonConverter()
  DateTime get totalTime;
  @override
  @LatLngJsonConverter()
  List<LatLng> get points;
  @override
  @JsonKey(ignore: true)
  _$$ExternalRouteImplCopyWith<_$ExternalRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
