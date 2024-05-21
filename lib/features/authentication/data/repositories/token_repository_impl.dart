import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/features/authentication/core/failures.dart';
import 'package:istu_map/features/authentication/data/datasources/authentication_api.dart';
import 'package:istu_map/features/authentication/domain/repositories/token_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenRepositoryImpl extends ExceptionsHandler implements TokenRepository {
  final FlutterSecureStorage _storage;
  final AuthenticationApi authenticationApi;
  String? _accessToken;
  String? _refreshToken;

  TokenRepositoryImpl(this._storage, this.authenticationApi, super.networkInfo);

  @override
  Future<void> clearStorage() async {
    return await _storage.deleteAll();
  }

  @override
  Future<Either<Failure, String>> getAuthToken() async {
    if (_accessToken != null) return Right(_accessToken!);
    var token = await _storage.read(key: 'AccessToken');
    if (token == null) return Left(NoTokenFailure());
    if (JwtDecoder.isExpired(token)) return Left(AccessTokenExpiredFailure());
    _accessToken = token;
    return Right(token);
  }

  @override
  Future<Either<Failure, String>> getRefreshToken() async {
    if (_refreshToken != null) return Right(_refreshToken!);
    var refreshToken = await _storage.read(key: 'RefreshToken');
    if (refreshToken == null) return Left(NoTokenFailure());
    if (JwtDecoder.isExpired(refreshToken)) {
      return Left(RefreshTokenExpiredFailure());
    }
    _refreshToken = refreshToken;
    return Right(refreshToken);
  }

  @override
  Future<void> setAuthToken(String token) async {
    _accessToken = token;
    return await _storage.write(key: 'AccessToken', value: token);
  }

  @override
  Future<void> setRefreshToken(String token) async {
    _refreshToken = token;
    return await _storage.write(key: 'RefreshToken', value: token);
  }

  @override
  Future<Either<Failure, String>> refreshAccessToken() async {
    var token = await getRefreshToken();
    return token.fold((l) => Left(l),
        (r) => getEither(() => authenticationApi.refreshAccessToken(r)));
  }
}
