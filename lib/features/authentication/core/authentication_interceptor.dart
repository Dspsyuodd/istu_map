import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:istu_map/features/authentication/core/failures.dart';
import 'package:istu_map/features/authentication/domain/repositories/token_repository.dart';

class AuthenticationInterceptor extends Interceptor {
  final TokenRepository tokenRepository;

  AuthenticationInterceptor(this.tokenRepository);
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var accessTokenEither = await tokenRepository.getAuthToken();
    log('GET AUTH TOKEN: $accessTokenEither');
    String? accessToken = await accessTokenEither.fold(
      (l) async {
        if (l is AccessTokenExpiredFailure) {
          var refreshEither = await tokenRepository.refreshAccessToken();
          return refreshEither.fold(
            (l) => null,
            (r) => r,
          );
        }
        return null;
      },
      (r) async => r,
    );

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }
}
