import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_dto.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@Freezed()
class UserData with _$UserData {
  const factory UserData({
    // ignore: invalid_annotation_target
    @JsonKey(name: "User") required UserDto userDto,
    String? accessToken,
    String? refreshToken,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
