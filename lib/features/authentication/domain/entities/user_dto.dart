import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@Freezed()
class UserDto with _$UserDto {
  const factory UserDto({
    required String email,
    String? password,
    String? firstName,
    String? lastName,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
