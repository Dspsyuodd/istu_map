import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:istu_map/config/constants/api_constants.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/authentication/core/authentication_interceptor.dart';
import 'package:istu_map/features/authentication/core/failures.dart';
import 'package:istu_map/features/authentication/domain/repositories/token_repository.dart';
import 'package:mocktail/mocktail.dart';

class TokenRepositoryMock extends Mock implements TokenRepository {}

void main() {
  late TokenRepositoryMock tokenRepositoryMock;
  late AuthenticationInterceptor authenticationInterceptor;
  setUp(() {
    tokenRepositoryMock = TokenRepositoryMock();
    authenticationInterceptor = AuthenticationInterceptor(tokenRepositoryMock);
  });

  group('request path is cansleUrlPath', () {
    final options = RequestOptions(path: ApiConstants.canselUriPath);
    test('shoul not call getAuthToken and set Authorization header of request',
        () async {
      await authenticationInterceptor.onRequest(
          options, RequestInterceptorHandler());
      verifyNever(() => tokenRepositoryMock.getAuthToken());
      expect(options.headers['Authorization'], null);
    });
  });

  group('request path is not cansleUrlPath', () {
    late RequestOptions options;
    const token = "testTokenValue";
    final serverFailure = ServerFailure('testMessage', 401);
    final unknownFailure = UnknownFailure('testMessage', 'testStackTrace');

    setUp(() {
      options = RequestOptions(path: "uriPath");
    });

    test(
        'should set Authorization header of request if repository return token',
        () async {
      when(() => tokenRepositoryMock.getAuthToken())
          .thenAnswer((_) async => const Right(token));
      await authenticationInterceptor.onRequest(
          options, RequestInterceptorHandler());

      verify(() => tokenRepositoryMock.getAuthToken()).called(1);
      expect(options.headers['Authorization'], 'Bearer $token');
    });

    test(
        'should not call refreshAccessToken and not set Authorization header of request if request is token refresh',
        () async {
      when(() => tokenRepositoryMock.getAuthToken())
          .thenAnswer((_) async => const Right(token));
      await authenticationInterceptor.onRequest(
          options, RequestInterceptorHandler());
      verifyNever(() => tokenRepositoryMock.refreshAccessToken());
      expect(options.headers['Authorization'], 'Bearer $token');
    });
    test(
        'should not call refreshAccessToken and not set Authorization header of request if token repository returns ServerFailure',
        () async {
      when(() => tokenRepositoryMock.getAuthToken())
          .thenAnswer((_) async => Left(serverFailure));
      await authenticationInterceptor.onRequest(
          options, RequestInterceptorHandler());

      verifyNever(() => tokenRepositoryMock.refreshAccessToken());
      expect(options.headers['Authorization'], null);
    });
    test(
        'should not call refreshAccessToken and not set Authorization header of request if token repository returns UnknownFailure',
        () async {
      when(() => tokenRepositoryMock.getAuthToken())
          .thenAnswer((_) async => Left(unknownFailure));
      await authenticationInterceptor.onRequest(
          options, RequestInterceptorHandler());
      verifyNever(() => tokenRepositoryMock.refreshAccessToken());
      expect(options.headers['Authorization'], null);
    });

    test(
        'should call refreshAccessToken if token repository returns AccessTokenExpiredFailure',
        () async {
      when(() => tokenRepositoryMock.getAuthToken())
          .thenAnswer((_) async => Left(AccessTokenExpiredFailure()));

      when(() => tokenRepositoryMock.refreshAccessToken())
          .thenAnswer((_) async => const Right(token));

      await authenticationInterceptor.onRequest(
          options, RequestInterceptorHandler());

      verify(() => tokenRepositoryMock.refreshAccessToken()).called(1);
    });

    test('should set Authorization header of request if token refresh success',
        () async {
      when(() => tokenRepositoryMock.getAuthToken())
          .thenAnswer((_) async => Left(AccessTokenExpiredFailure()));
      when(() => tokenRepositoryMock.refreshAccessToken())
          .thenAnswer((_) async => const Right(token));
      await authenticationInterceptor.onRequest(
          options, RequestInterceptorHandler());

      expect(options.headers['Authorization'], 'Bearer $token');
    });

    test('should not set Authorization header of request if token refresh fail',
        () async {
      when(() => tokenRepositoryMock.getAuthToken())
          .thenAnswer((_) async => Left(AccessTokenExpiredFailure()));
      when(() => tokenRepositoryMock.refreshAccessToken())
          .thenAnswer((_) async => Left(serverFailure));
      await authenticationInterceptor.onRequest(
          options, RequestInterceptorHandler());
      expect(options.headers['Authorization'], null);
    });
  });
}
