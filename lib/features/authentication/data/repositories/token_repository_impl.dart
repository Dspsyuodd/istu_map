import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_errors_handler.dart';
import '../../core/failures.dart';
import '../datasources/authentication_api.dart';
import '../../domain/repositories/token_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenRepositoryImpl extends ExceptionsHandler implements TokenRepository {
  final FlutterSecureStorage _storage;
  final AuthenticationApi authenticationApi;
  final _tokens = <String, String>{};

  TokenRepositoryImpl(this._storage, this.authenticationApi, super.networkInfo);

  @override
  Future<void> clearStorage() async {
    _tokens.clear();
    await _storage.delete(key: 'AccessToken');
    await _storage.delete(key: 'RefreshToken');
    return;
  }

  @override
  Future<Either<Failure, String>> getAuthToken() async {
    return _getToken('AccessToken');
  }

  @override
  Future<Either<Failure, String>> getRefreshToken() async {
    return _getToken('RefreshToken');
  }

  @override
  Future<void> setAuthToken(String token) async {
    await _setToken('AccessToken', token);
  }

  @override
  Future<void> setRefreshToken(String token) async {
    await _setToken('RefreshToken', token);
  }

  Future<Either<Failure, String>> _getToken(String key) async {
    if (_tokens[key] != null) return Right(_tokens[key]!);
    var token = await _storage.read(key: key);
    if (token == null) return Left(NoTokenFailure());
    try {
      if (JwtDecoder.isExpired(token)) {
        return Left(TokenFailure.getFailure(key));
      }
    } on FormatException {
      clearStorage();
      return Left(NoTokenFailure());
    }

    _tokens[key] = token;
    return Right(token);
  }

  Future<void> _setToken(String key, String token) async {
    _tokens[key] = token;
    return await _storage.write(key: key, value: token);
  }

  @override
  Future<Either<Failure, String>> refreshAccessToken() async {
    var token = await getRefreshToken();
    return await token.fold(
      (l) async => Left(l),
      (r) async => getEither(
        () async => authenticationApi.refreshAccessToken(r).then(
          (json) async {
            var access = jsonDecode(json)['AccessToken'] as String;
            var refresh = jsonDecode(json)['RefreshToken'] as String;
            await setAuthToken(access);
            await setRefreshToken(refresh);
            return access;
          },
        ),
      ),
    );
  }
}
