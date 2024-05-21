import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserDtoModel extends UserDto {
  const UserDtoModel(
      {required super.email, super.password, super.firstName, super.lastName});

  factory UserDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UserDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoModelToJson(this);
}
