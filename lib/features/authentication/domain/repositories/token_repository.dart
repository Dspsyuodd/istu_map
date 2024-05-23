import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';

abstract interface class TokenRepository {
  Future<Either<Failure, String>> getAuthToken();
  Future<void> setAuthToken(String token);
  Future<void> setRefreshToken(String token);
  Future<void> clearStorage();
  Future<Either<Failure, String>> getRefreshToken();
  Future<Either<Failure, String>> refreshAccessToken();
}
