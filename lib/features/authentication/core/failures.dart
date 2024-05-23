import '../../../core/errors/failure.dart';

class AccessTokenExpiredFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class RefreshTokenExpiredFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoTokenFailure extends Failure {
  @override
  List<Object?> get props => [];
}

abstract class TokenFailure {
  static final Map<String, Failure> _failures = {
    "AccessToken": AccessTokenExpiredFailure(),
    "RefreshToken": RefreshTokenExpiredFailure(),
  };
  static Failure getFailure(String key) {
    if (_failures.containsKey(key)) {
      return _failures[key]!;
    }
    else {
      throw Exception("Unknown failure for token: $key");
    }
  }
}