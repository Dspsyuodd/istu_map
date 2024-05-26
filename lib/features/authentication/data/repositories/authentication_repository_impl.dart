import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_errors_handler.dart';
import '../datasources/authentication_api.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/entities/user_dto.dart';
import '../../domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends ExceptionsHandler
    implements AuthenticationRepository {
  final AuthenticationApi authenticationApi;

  AuthenticationRepositoryImpl(this.authenticationApi, super.networkInfo);
  @override
  Future<Either<Failure, UserData>> login(UserDto data) async {
    return getEither(() => authenticationApi
        .login(UserDto(email: data.email, password: data.password)));
  }

  @override
  Future<Either<Failure, UserData>> loginViaIstuAcc(String code) {
    return getEither(() => authenticationApi.loginViaIstuAcc(code));
  }

  @override
  Future<Either<Failure, UserDto>> registration(UserDto data) {
    assert(data.firstName != null && data.lastName != null);
    return getEither(() => authenticationApi.registration(UserDto(
          email: data.email,
          password: data.password,
          firstName: data.firstName,
          lastName: data.lastName,
        )));
  }
}
