// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      userDto: UserDtoModel.fromJson(json['User'] as Map<String, dynamic>),
      accessToken: json['AccessToken'] as String?,
      refreshToken: json['RefreshToken'] as String?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'AccessToken': instance.accessToken,
      'RefreshToken': instance.refreshToken,
      'User': instance.userDto,
    };
