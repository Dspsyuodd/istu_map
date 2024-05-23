// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      email: json['Email'] as String,
      password: json['Password'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
    };
