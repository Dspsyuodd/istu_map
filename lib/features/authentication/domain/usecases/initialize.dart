import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../core/failures.dart';
import '../repositories/authentication_repository.dart';
import '../repositories/token_repository.dart';

class Initialize {
  final TokenRepository tokenRepository;
  final AuthenticationRepository authenticationRepository;

  Initialize(this.tokenRepository, this.authenticationRepository);
  Future<Either<Failure, void>> call() async {
    var token = await tokenRepository.getAuthToken();
    return token.fold(
      (l) async {
        if (l is AccessTokenExpiredFailure) {
          var refresh = await tokenRepository.refreshAccessToken();
          return refresh.fold(
            (l) => Left(l),
            (r) {
              return const Right(null);
            },
          );
        }
        return Left(l);
      },
      (r) => const Right(null),
    );
  }
}
