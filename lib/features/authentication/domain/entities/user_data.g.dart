// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      userDto: UserDto.fromJson(json['User'] as Map<String, dynamic>),
      accessToken: json['AccessToken'] as String?,
      refreshToken: json['RefreshToken'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'User': instance.userDto.toJson(),
      'AccessToken': instance.accessToken,
      'RefreshToken': instance.refreshToken,
    };
