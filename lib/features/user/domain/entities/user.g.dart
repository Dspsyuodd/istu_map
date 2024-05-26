// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['Id'] as String,
      email: json['Email'] as String,
      firstName: json['FirstName'] as String,
      lastName: json['LastName'] as String,
      role: (json['Role'] as num).toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Email': instance.email,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Role': instance.role,
    };
