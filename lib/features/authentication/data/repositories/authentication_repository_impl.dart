import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/features/authentication/data/datasources/authentication_api.dart';
import 'package:istu_map/features/authentication/data/models/user_dto_model.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:istu_map/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends ExceptionsHandler
    implements AuthenticationRepository {
  final AuthenticationApi authenticationApi;

  AuthenticationRepositoryImpl(this.authenticationApi, super.networkInfo);
  @override
  Future<Either<Failure, UserData>> login(UserDto data) async {
    return getEither(() => authenticationApi.login(UserDtoModel(
        email: data.email, password: data.password)));
  }

  @override
  Future<Either<Failure, void>> loginViaIstuAcc() {
    // TODO: implement loginViaIstuAcc
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserDto>> registration(UserDto data) {
    assert(data.firstName != null && data.lastName != null);
    return getEither(() => authenticationApi.registration(UserDtoModel(
          email: data.email,
          password: data.password,
          firstName: data.firstName,
          lastName: data.lastName,
        )));
  }

  @override
  Future<Either<Failure, UserDto>> getUser() {
    return getEither(() => authenticationApi.getUser());
  }
}
