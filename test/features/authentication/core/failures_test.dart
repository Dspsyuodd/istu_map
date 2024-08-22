import 'package:flutter_test/flutter_test.dart';
import 'package:istu_map/features/authentication/core/failures.dart';

void main() {
  test('should return AccessTokenExpiredFailure if getFailure is called with "AccessToken"', () {
    final result = TokenFailure.getFailure("AccessToken");
    expect(result, isA<AccessTokenExpiredFailure>());
  });

  test('should return RefreshTokenExpiredFailure if getFailure is called with "RefreshToken"', () {
    final result = TokenFailure.getFailure("RefreshToken");
    expect(result, isA<RefreshTokenExpiredFailure>());
  });

  test('should throw exception if getFailure is called with unknown token name', () {
    expect(() => TokenFailure.getFailure("XyZ123!@#QaZrT9_2024_neverUsedString"), throwsException);
  });
}