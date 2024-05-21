import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/authentication/core/failures.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:istu_map/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:istu_map/features/authentication/domain/repositories/token_repository.dart';

class Initialize {
  final TokenRepository tokenRepository;
  final AuthenticationRepository authenticationRepository;

  Initialize(this.tokenRepository, this.authenticationRepository);
  Future<Either<Failure, UserDto>> call() async {
    var token = await tokenRepository.getAuthToken();
    return token.fold(
      (l) async {
        if (l is AccessTokenExpiredFailure) {
          var refresh = await tokenRepository.refreshAccessToken();
          return await refresh.fold(
            (l) async => Left(l),
            (r) async {
              tokenRepository.setAuthToken(r);
              return await authenticationRepository.getUser();
            },
          );
        }
        return Left(l);
      },
      (r) => authenticationRepository.getUser(),
    );
  }
}
