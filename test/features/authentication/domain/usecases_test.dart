import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/authentication/core/failures.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:istu_map/features/authentication/domain/entities/user_dto.dart';
import 'package:istu_map/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:istu_map/features/authentication/domain/repositories/token_repository.dart';
import 'package:istu_map/features/authentication/domain/usecases/initialize.dart';
import 'package:istu_map/features/authentication/domain/usecases/login.dart';
import 'package:istu_map/features/authentication/domain/usecases/login_via_istu_acc.dart';
import 'package:istu_map/features/authentication/domain/usecases/logout.dart';
import 'package:istu_map/features/authentication/domain/usecases/register.dart';
import 'package:mocktail/mocktail.dart';

class TokenRepositoryMock extends Mock implements TokenRepository {}

class AuthenticationRepositoryMock extends Mock
    implements AuthenticationRepository {}

class FakeUserDto extends Fake implements UserDto {}

void main() {
  const token = 'testToken';
  final serverFailure = ServerFailure('testMessage', 401);
  final unknownFailure = UnknownFailure('testMessage', 'testStackTrace');
  final noTokenFailure = NoTokenFailure();
  final accessTokenExpiredFailure = AccessTokenExpiredFailure();

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
  const userDataWithNullTokens = UserData(
    userDto: userDto,
  );
  group('Autentication usecases', () {
    late TokenRepositoryMock tokenRepositoryMock;
    late AuthenticationRepositoryMock authenticationRepositoryMock;

    setUp(() {
      tokenRepositoryMock = TokenRepositoryMock();
      authenticationRepositoryMock = AuthenticationRepositoryMock();
    });

    group('tokens initialization', () {
      late InitializeTokens usecase;
      setUp(() {
        usecase =
            InitializeTokens(tokenRepositoryMock, authenticationRepositoryMock);
      });
      test('should return right if tokens are initialized successfully',
          () async {
        when(() => tokenRepositoryMock.getAuthToken())
            .thenAnswer((_) async => right(token));
        final result = await usecase(NoParams());
        expect(result.isRight(), true);
      });

      test('should return NoTokenFailure if failed to get tokens', () async {
        when(() => tokenRepositoryMock.getAuthToken())
            .thenAnswer((_) async => left(noTokenFailure));

        final result = await usecase(NoParams());
        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => null), noTokenFailure);
      });

      test(
          'should return Right when AccessTokenExpiredFailure and access token refresh succeed',
          () async {
        when(() => tokenRepositoryMock.getAuthToken())
            .thenAnswer((_) async => left(accessTokenExpiredFailure));

        when(() => tokenRepositoryMock.refreshAccessToken())
            .thenAnswer((_) async => right(token));

        final result = await usecase(NoParams());
        expect(result.isRight(), true);
      });

      test('should return ServerFailure if access token refresh failed',
          () async {
        when(() => tokenRepositoryMock.getAuthToken())
            .thenAnswer((_) async => left(accessTokenExpiredFailure));

        when(() => tokenRepositoryMock.refreshAccessToken())
            .thenAnswer((_) async => left(serverFailure));

        final result = await usecase(NoParams());
        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => null), serverFailure);
      });

      test(
          'should return unknown failure if unknown error occurs during initialization',
          () async {
        when(() => tokenRepositoryMock.getAuthToken())
            .thenAnswer((_) async => left(unknownFailure));

        final result = await usecase(NoParams());
        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => null), unknownFailure);
      });
    });

    group('login', () {
      late Login usecase;
      setUp(() {
        registerFallbackValue(FakeUserDto());
        usecase = Login(authenticationRepositoryMock, tokenRepositoryMock);
      });

      test('should return userData with tokens if login is successful',
          () async {
        when(() => authenticationRepositoryMock.login(any()))
            .thenAnswer((_) async => const Right(userData));

        when(() => tokenRepositoryMock.setAuthToken(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => tokenRepositoryMock.setRefreshToken(any()))
            .thenAnswer((_) async => const Right(null));

        final result = await usecase(LoginParams(
          email: userDto.email,
          password: userDto.password!,
        ));

        expect(result.isRight(), true);
        expect(result.fold((l) => l, (r) => r), userData);
      });

      test('shoud return failure if login fails', () async {
        when(() => authenticationRepositoryMock.login(any()))
            .thenAnswer((_) async => Left(serverFailure));
        final result = await usecase(LoginParams(
          email: userDto.email,
          password: userDto.password!,
        ));
        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => null), serverFailure);
      });

      test(
          'should throw exception if AuthenticationRepository returns UserData with null tokens',
          () async {
        when(() => authenticationRepositoryMock.login(any()))
            .thenAnswer((_) async => const Right(userDataWithNullTokens));

        try {
          await usecase(LoginParams(
            email: userDto.email,
            password: userDto.password!,
          ));
          fail('expected an error, but got success response');
        } catch (e) {
          expect(e, isA<TypeError>());
        }
      });
    });

    group('loginViaIstuAcc', () {
      late LoginViaIstuAcc usecase;
      setUp(() {
        registerFallbackValue(FakeUserDto());
        usecase =
            LoginViaIstuAcc(authenticationRepositoryMock, tokenRepositoryMock);
      });

      test('should return userDto if login is successful', () async {
        when(() => authenticationRepositoryMock.loginViaIstuAcc(any()))
            .thenAnswer((_) async => const Right(userData));
        when(() => tokenRepositoryMock.setAuthToken(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => tokenRepositoryMock.setRefreshToken(any()))
            .thenAnswer((_) async => const Right(null));
        final result = await usecase(LoginViaIstuAccParams(
          Uri.parse('https://test.com?code=testCode'),
        ));
        expect(result.isRight(), true);
        expect(result.fold((l) => l, (r) => r), userDto);
      });

      test('shoud return failure if login fails', () async {
        when(() => authenticationRepositoryMock.loginViaIstuAcc(any()))
            .thenAnswer((_) async => Left(serverFailure));
        final result = await usecase(LoginViaIstuAccParams(
          Uri.parse('https://test.com?code=testCode'),
        ));
        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => null), serverFailure);
      });

       test(
          'should throw exception if AuthenticationRepository returns UserData with null tokens',
          () async {
        when(() => authenticationRepositoryMock.login(any()))
            .thenAnswer((_) async => const Right(userDataWithNullTokens));

        try {
          await usecase(LoginViaIstuAccParams(
            Uri.parse('https://test.com?code=testCode'),
          ));
          fail('expected an error, but got success response');
        } catch (e) {
          expect(e, isA<TypeError>());
        }
      });
    });

    group('logout', () {
      late Logout usecase;
      setUp(() {
        usecase = Logout(tokenRepositoryMock);
      });

      test('should Right null if logout is successful', () async {
        when(() => tokenRepositoryMock.clearStorage())
            .thenAnswer((_) async => const Right(null));

        final result = await usecase(NoParams());
        expect(result.isRight(), true);
      });
    });

    group('register', () {
      late Register usecase;
      setUp(() {
        usecase = Register(authenticationRepositoryMock);
      });

      test('should return userDto if registration is successful', () async {
        when(() => authenticationRepositoryMock.registration(userDto))
            .thenAnswer((_) async => const Right(userDto));

        final result = await usecase(RegisterParams(
          email: userDto.email,
          password: userDto.password!,
          firstName: userDto.firstName!,
          lastName: userDto.lastName!,
        ));

        expect(result.isRight(), true);
        expect(result.fold((l) => l, (r) => r), userDto);
      });

      test('shoud return failure if registration fails', () async {
        when(() => authenticationRepositoryMock.registration(userDto))
            .thenAnswer((_) async => Left(serverFailure));

        final result = await usecase(RegisterParams(
          email: userDto.email,
          password: userDto.password!,
          firstName: userDto.firstName!,
          lastName: userDto.lastName!,
        ));

        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => null), serverFailure);
      });
    });
  });
}
