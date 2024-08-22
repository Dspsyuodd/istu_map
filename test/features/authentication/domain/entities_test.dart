import 'package:flutter_test/flutter_test.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';

void main() {
  group('entities parse test', () {
    const testUserDtoJson = {
      'Email': 'testEmail@test.com',
      'Password': 'testPassword',
      'FirstName': 'testFirstName',
      'LastName': 'testLastName',
    };
    const testUserDataJson = {
      'User': testUserDtoJson,
      'AccessToken': 'testToken',
      'RefreshToken': 'testRefreshToken',
    };
    test('should return correct user data from json', () {
      final result = UserData.fromJson(testUserDataJson);

      expect(result.userDto.email, 'testEmail@test.com');
      expect(result.userDto.password, 'testPassword');
      expect(result.userDto.firstName, 'testFirstName');
      expect(result.userDto.lastName, 'testLastName');
    });

    test('should return correct user data from json', () {
      final result = UserData.fromJson(testUserDataJson);
      expect(result.accessToken, 'testToken');
      expect(result.refreshToken, 'testRefreshToken');
    });
  });
}
