import 'package:istu_map/features/authentication/data/models/user_dto_model.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserDataModel extends UserData {
  const UserDataModel({
    required UserDtoModel userDto,
    super.accessToken,
    super.refreshToken,
  }) : super(userDto: userDto as UserDto);

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

