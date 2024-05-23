import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../core/failures.dart';
import '../entities/user_dto.dart';
import '../repositories/authentication_repository.dart';
import '../repositories/token_repository.dart';

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
