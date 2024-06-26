import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/user_data.dart';
import '../entities/user_dto.dart';
import '../repositories/authentication_repository.dart';
import '../repositories/token_repository.dart';

class Login extends Usecase<void, LoginParams> {
  final AuthenticationRepository authenticationRepository;
  final TokenRepository tokenRepository;

  Login(this.authenticationRepository, this.tokenRepository);

  @override
  Future<Either<Failure, UserData>> call(LoginParams params) async {
    var result = await authenticationRepository
        .login(UserDto(email: params.email, password: params.password));
    return result.fold(
      (l) async => Left(l),
      (r) async {
        await tokenRepository.setAuthToken(r.accessToken!);
        await tokenRepository.setRefreshToken(r.refreshToken!);
        return Right(r);
      },
    );
  }
}

class LoginParams extends NoParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
