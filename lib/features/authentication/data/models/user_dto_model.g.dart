// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDtoModel _$UserDtoModelFromJson(Map<String, dynamic> json) => UserDtoModel(
      email: json['Email'] as String,
      password: json['Password'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
    );

Map<String, dynamic> _$UserDtoModelToJson(UserDtoModel instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
    };
