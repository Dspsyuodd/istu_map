import 'package:dio/dio.dart';
import '../../../config/constants/api_constants.dart';
import 'failures.dart';
import '../domain/repositories/token_repository.dart';

class AuthenticationInterceptor extends Interceptor {
  final TokenRepository tokenRepository;

  AuthenticationInterceptor(this.tokenRepository);
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path == ApiConstants.canselUriPath) return;
    var accessTokenEither = await tokenRepository.getAuthToken();
    String? accessToken = await accessTokenEither.fold(
      (l) async {
        if (options.path.contains(ApiConstants.refresh)) return null;
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
