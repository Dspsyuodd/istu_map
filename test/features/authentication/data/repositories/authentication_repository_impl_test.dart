import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/exceptions.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/network_info.dart';
import 'package:istu_map/features/authentication/data/datasources/authentication_api.dart';
import 'package:istu_map/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:istu_map/features/authentication/domain/entities/user_dto.dart';
import 'package:mocktail/mocktail.dart';

class AuthenticationApiMock extends Mock implements AuthenticationApi {}

class NetworkInfoMock extends Mock implements NetworkInfo {}

class UserDtoFake extends Fake implements UserDto {}

void main() {
  late AuthenticationApiMock authenticationApiMock;
  late NetworkInfoMock networkInfoMock;
  late AuthenticationRepositoryImpl authenticationRepositoryMock;
  const userDto = UserDto(
    email: 'testEmail@test.com',
    password: 'testPassword',
    firstName: 'testFirstName',
    lastName: 'testLastName',
  );
  const userData = UserData(
    userDto: userDto,
    accessToken: 'testToken',
    refreshToken: 'testRefreshToken',
  );
  final serverFailure = ServerFailure('testMessage', 401);
  final serverException = ServerException('testMessage', 401);
  setUp(() {
    registerFallbackValue(UserDtoFake());
    authenticationApiMock = AuthenticationApiMock();
    networkInfoMock = NetworkInfoMock();
    when(() => networkInfoMock.isConnected).thenAnswer((_) async => true);
    authenticationRepositoryMock =
        AuthenticationRepositoryImpl(authenticationApiMock, networkInfoMock);
  });

  group('login', () {
    test('should return UserData when login is successful', () async {
      when(() => authenticationApiMock.login(any()))
          .thenAnswer((_) async => userData);

      final result = await authenticationRepositoryMock.login(userDto);
      expect(result, const Right(userData));
    });

    test('should return Failure when login is unsuccessful due to ServerException', () async {
      when(() => authenticationApiMock.login(any()))
          .thenThrow(serverException);
      final result = await authenticationRepositoryMock.login(userDto);
      expect(result, Left(serverFailure));
    });

    test('should return Failure when login is unsuccessful due to UnknownException', () async {
      when(() => authenticationApiMock.login(any()))
          .thenThrow(Exception());
      final result = await authenticationRepositoryMock.login(userDto);
      result.fold(
        (failure) {
          expect(failure, isA<UnknownFailure>());
        },
        (userData) => fail('Expected a Failure but got a UserData'),
      );
    });
  });

  group('loginViaIstuAcc', () {
    test('should return UserData when loginViaIstuAcc is successful', () async {
      when(() => authenticationApiMock.loginViaIstuAcc(any()))
          .thenAnswer((_) async => userData);

      final result = await authenticationRepositoryMock.loginViaIstuAcc('code');
      expect(result, const Right(userData));
    });

    test('should return Failure when loginViaIstuAcc is unsuccessful due to ServerException', () async {
      when(() => authenticationApiMock.loginViaIstuAcc(any()))
          .thenThrow(serverException);
      final result = await authenticationRepositoryMock.loginViaIstuAcc('code');
      expect(result, Left(serverFailure));
    });

    test('should return Failure when loginViaIstuAcc is unsuccessful due to UnknownException', () async {
      when(() => authenticationApiMock.loginViaIstuAcc(any()))
          .thenThrow(Exception());
      final result = await authenticationRepositoryMock.loginViaIstuAcc('code');
      result.fold(
        (failure) {
          expect(failure, isA<UnknownFailure>());
        },
        (userData) => fail('Expected a Failure but got a UserData'),
      );
    });
  });

  group('registration', () {
    test('should return UserData when registration is successful', () async {
      when(() => authenticationApiMock.registration(any()))
          .thenAnswer((_) async => userDto);

      final result = await authenticationRepositoryMock.registration(userDto);
      expect(result, const Right(userDto));
    });

    test('should return Failure when registration is unsuccessful due to ServerException', () async {
      when(() => authenticationApiMock.registration(any()))
          .thenThrow(serverException);
      final result = await authenticationRepositoryMock.registration(userDto);
      expect(result, Left(serverFailure));
    });

    test('should return Failure when registration is unsuccessful due to UnknownException', () async {
      when(() => authenticationApiMock.registration(any()))
          .thenThrow(Exception());
      final result = await authenticationRepositoryMock.registration(userDto);
      result.fold(
        (failure) {
          expect(failure, isA<UnknownFailure>());
        },
        (userData) => fail('Expected a Failure but got a UserData'),
      );
    });
  });
}
