import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:istu_map/features/authentication/domain/entities/user_dto.dart';
import 'package:istu_map/features/authentication/domain/usecases/initialize.dart';
import 'package:istu_map/features/authentication/domain/usecases/login.dart';
import 'package:istu_map/features/authentication/domain/usecases/login_via_istu_acc.dart';
import 'package:istu_map/features/authentication/domain/usecases/logout.dart';
import 'package:istu_map/features/authentication/domain/usecases/register.dart';
import 'package:istu_map/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:bloc_test/bloc_test.dart';

class LoginMock extends Mock implements Login {}

class RegisterMock extends Mock implements Register {}

class LoginViaIstuAccMock extends Mock implements LoginViaIstuAcc {}

class InitializeTokensMock extends Mock implements InitializeTokens {}

class LogoutMock extends Mock implements Logout {}

class FakeLoginParams extends Fake implements LoginParams {}

class FakeRegisterParams extends Fake implements RegisterParams {}

void main() {
  group(AuthenticationBloc, () {
    late AuthenticationBloc authenticationBloc;
    late LoginMock loginMock;
    late RegisterMock registerMock;
    late LoginViaIstuAccMock loginViaIstuAccMock;
    late InitializeTokensMock initializeTokensMock;
    late LogoutMock logoutMock;
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
    final unknownFailure = UnknownFailure('testMessage', 'testStackTrace');

    setUp(() {
      registerFallbackValue(FakeLoginParams());
      registerFallbackValue(FakeRegisterParams());


      loginMock = LoginMock();
      registerMock = RegisterMock();
      loginViaIstuAccMock = LoginViaIstuAccMock();
      initializeTokensMock = InitializeTokensMock();
      logoutMock = LogoutMock();

      authenticationBloc = AuthenticationBloc(
        loginMock,
        registerMock,
        loginViaIstuAccMock,
        initializeTokensMock,
        logoutMock,
      );
    });

    test('initial state is AuthenticationInitial', () {
      expect(authenticationBloc.state, AuthenticationInitial());
    });

    blocTest(
      'should emit [LoginSuccess] when login is successful',
      build: () {
        when(() => loginMock(
              any(),
            )).thenAnswer((_) async => const Right(userData));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const LoginEvent(userData)),
      expect: () => [
        AuthenticationLoading(),
        const LoginSuccess(),
      ],
    );

    blocTest(
      'should emit [AuthenticationFailure] when login is unsuccessful due to server error',
      build: () {
        when(() => loginMock(
              any(),
            )).thenAnswer((_) async => Left(serverFailure));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const LoginEvent(userData)),
      expect: () => [
        AuthenticationLoading(),
        AuthenticationFailure(),
      ],
    );

    blocTest(
      'should emit [AuthenticationFailure] when login is unsuccessful due to unknown error',
      build: () {
        when(() => loginMock(
              any(),
            )).thenAnswer((_) async => Left(unknownFailure));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const LoginEvent(userData)),
      expect: () => [
        AuthenticationLoading(),
        AuthenticationFailure(),
      ],
    );

    blocTest(
      'should emit [LogoutSuccess] when logout is successful',
      build: () {
        when(() => logoutMock(
              any(),
            )).thenAnswer((_) async => Right(Future.value()));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const LogoutEvent()),
      expect: () => [
        AuthenticationLoading(),
        const LogoutSuccess(),
      ],
    );

    blocTest(
      'should emit [RegistrationSuccess] when registration is successful',
      build: () {
        when(() => registerMock(
              any(),
            )).thenAnswer((_) async => const Right(userDto));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const RegisterEvent(userData)),
      expect: () => [
        AuthenticationLoading(),
        const RegistrationSuccess(userDto),
      ],
    );
  });
}
