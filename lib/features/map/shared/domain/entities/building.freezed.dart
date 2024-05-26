// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'building.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Building _$BuildingFromJson(Map<String, dynamic> json) {
  return _Building.fromJson(json);
}

/// @nodoc
mixin _$Building {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @LatLngJsonConverter()
  LatLng get externalPosition => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<FloorInfo> get floors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuildingCopyWith<Building> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildingCopyWith<$Res> {
  factory $BuildingCopyWith(Building value, $Res Function(Building) then) =
      _$BuildingCopyWithImpl<$Res, Building>;
  @useResult
  $Res call(
      {String id,
      String title,
      String address,
      @LatLngJsonConverter() LatLng externalPosition,
      String description,
      List<FloorInfo> floors});
}

/// @nodoc
class _$BuildingCopyWithImpl<$Res, $Val extends Building>
    implements $BuildingCopyWith<$Res> {
  _$BuildingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? address = null,
    Object? externalPosition = null,
    Object? description = null,
    Object? floors = null,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      externalPosition: null == externalPosition
          ? _value.externalPosition
          : externalPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      floors: null == floors
          ? _value.floors
          : floors // ignore: cast_nullable_to_non_nullable
              as List<FloorInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuildingImplCopyWith<$Res>
    implements $BuildingCopyWith<$Res> {
  factory _$$BuildingImplCopyWith(
          _$BuildingImpl value, $Res Function(_$BuildingImpl) then) =
      __$$BuildingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String address,
      @LatLngJsonConverter() LatLng externalPosition,
      String description,
      List<FloorInfo> floors});
}

/// @nodoc
class __$$BuildingImplCopyWithImpl<$Res>
    extends _$BuildingCopyWithImpl<$Res, _$BuildingImpl>
    implements _$$BuildingImplCopyWith<$Res> {
  __$$BuildingImplCopyWithImpl(
      _$BuildingImpl _value, $Res Function(_$BuildingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? address = null,
    Object? externalPosition = null,
    Object? description = null,
    Object? floors = null,
  }) {
    return _then(_$BuildingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      externalPosition: null == externalPosition
          ? _value.externalPosition
          : externalPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      floors: null == floors
          ? _value._floors
          : floors // ignore: cast_nullable_to_non_nullable
              as List<FloorInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuildingImpl implements _Building {
  const _$BuildingImpl(
      {required this.id,
      required this.title,
      required this.address,
      @LatLngJsonConverter() required this.externalPosition,
      required this.description,
      required final List<FloorInfo> floors})
      : _floors = floors;

  factory _$BuildingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuildingImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String address;
  @override
  @LatLngJsonConverter()
  final LatLng externalPosition;
  @override
  final String description;
  final List<FloorInfo> _floors;
  @override
  List<FloorInfo> get floors {
    if (_floors is EqualUnmodifiableListView) return _floors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_floors);
  }

  @override
  String toString() {
    return 'Building(id: $id, title: $title, address: $address, externalPosition: $externalPosition, description: $description, floors: $floors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuildingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.externalPosition, externalPosition) ||
                other.externalPosition == externalPosition) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._floors, _floors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      address,
      externalPosition,
      description,
      const DeepCollectionEquality().hash(_floors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildingImplCopyWith<_$BuildingImpl> get copyWith =>
      __$$BuildingImplCopyWithImpl<_$BuildingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuildingImplToJson(
      this,
    );
  }
}

abstract class _Building implements Building {
  const factory _Building(
      {required final String id,
      required final String title,
      required final String address,
      @LatLngJsonConverter() required final LatLng externalPosition,
      required final String description,
      required final List<FloorInfo> floors}) = _$BuildingImpl;

  factory _Building.fromJson(Map<String, dynamic> json) =
      _$BuildingImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get address;
  @override
  @LatLngJsonConverter()
  LatLng get externalPosition;
  @override
  String get description;
  @override
  List<FloorInfo> get floors;
  @override
  @JsonKey(ignore: true)
  _$$BuildingImplCopyWith<_$BuildingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FloorInfo _$FloorInfoFromJson(Map<String, dynamic> json) {
  return _FloorInfo.fromJson(json);
}

/// @nodoc
mixin _$FloorInfo {
  int get floorNumber => throw _privateConstructorUsedError;
  String get floorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FloorInfoCopyWith<FloorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorInfoCopyWith<$Res> {
  factory $FloorInfoCopyWith(FloorInfo value, $Res Function(FloorInfo) then) =
      _$FloorInfoCopyWithImpl<$Res, FloorInfo>;
  @useResult
  $Res call({int floorNumber, String floorId});
}

/// @nodoc
class _$FloorInfoCopyWithImpl<$Res, $Val extends FloorInfo>
    implements $FloorInfoCopyWith<$Res> {
  _$FloorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floorNumber = null,
    Object? floorId = null,
  }) {
    return _then(_value.copyWith(
      floorNumber: null == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int,
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloorInfoImplCopyWith<$Res>
    implements $FloorInfoCopyWith<$Res> {
  factory _$$FloorInfoImplCopyWith(
          _$FloorInfoImpl value, $Res Function(_$FloorInfoImpl) then) =
      __$$FloorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int floorNumber, String floorId});
}

/// @nodoc
class __$$FloorInfoImplCopyWithImpl<$Res>
    extends _$FloorInfoCopyWithImpl<$Res, _$FloorInfoImpl>
    implements _$$FloorInfoImplCopyWith<$Res> {
  __$$FloorInfoImplCopyWithImpl(
      _$FloorInfoImpl _value, $Res Function(_$FloorInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floorNumber = null,
    Object? floorId = null,
  }) {
    return _then(_$FloorInfoImpl(
      floorNumber: null == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int,
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FloorInfoImpl implements _FloorInfo {
  const _$FloorInfoImpl({required this.floorNumber, required this.floorId});

  factory _$FloorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FloorInfoImplFromJson(json);

  @override
  final int floorNumber;
  @override
  final String floorId;

  @override
  String toString() {
    return 'FloorInfo(floorNumber: $floorNumber, floorId: $floorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorInfoImpl &&
            (identical(other.floorNumber, floorNumber) ||
                other.floorNumber == floorNumber) &&
            (identical(other.floorId, floorId) || other.floorId == floorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, floorNumber, floorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorInfoImplCopyWith<_$FloorInfoImpl> get copyWith =>
      __$$FloorInfoImplCopyWithImpl<_$FloorInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloorInfoImplToJson(
      this,
    );
  }
}

abstract class _FloorInfo implements FloorInfo {
  const factory _FloorInfo(
      {required final int floorNumber,
      required final String floorId}) = _$FloorInfoImpl;

  factory _FloorInfo.fromJson(Map<String, dynamic> json) =
      _$FloorInfoImpl.fromJson;

  @override
  int get floorNumber;
  @override
  String get floorId;
  @override
  @JsonKey(ignore: true)
  _$$FloorInfoImplCopyWith<_$FloorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
