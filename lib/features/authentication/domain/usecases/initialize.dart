import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import '../../../../core/errors/failure.dart';
import '../../core/failures.dart';
import '../repositories/authentication_repository.dart';
import '../repositories/token_repository.dart';

class InitializeTokens extends Usecase<void, NoParams> {
  final TokenRepository tokenRepository;
  final AuthenticationRepository authenticationRepository;

  InitializeTokens(this.tokenRepository, this.authenticationRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
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
