import 'package:fpdart/fpdart.dart';
import 'package:istu_map/features/authentication/domain/entities/user_dto.dart';
import 'package:istu_map/features/authentication/domain/repositories/token_repository.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/authentication_repository.dart';

class LoginViaIstuAcc extends Usecase<void, LoginViaIstuAccParams> {
  final AuthenticationRepository authenticationRepository;
  final TokenRepository tokenRepository;

  LoginViaIstuAcc(this.authenticationRepository, this.tokenRepository);
  @override
  Future<Either<Failure, UserDto>> call(LoginViaIstuAccParams params) async {
    var response = await authenticationRepository
        .loginViaIstuAcc(params.callbackUri.queryParameters['code']!);
    return await response.fold(
      (l) async => Left(l),
      (r) async {
        tokenRepository.setAuthToken(r.accessToken!);
        tokenRepository.setRefreshToken(r.refreshToken!);
        return Right(r.userDto);
      },
    );
  }
}

class LoginViaIstuAccParams extends NoParams {
  final Uri callbackUri;

  LoginViaIstuAccParams(this.callbackUri);

  @override
  List<Object?> get props => [callbackUri];
}
