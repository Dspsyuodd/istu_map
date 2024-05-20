import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/features/authentication/data/datasources/authentication_api.dart';
import 'package:istu_map/features/authentication/data/models/user_data_model.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';
import 'package:istu_map/features/authentication/domain/repositories/authentication_repositoru.dart';

class AuthenticationRepositoryImpl extends ExceptionsHandler
    implements AuthenticationRepository {
  final AuthenticationApi authenticationApi;

  AuthenticationRepositoryImpl(this.authenticationApi, super.networkInfo);
  @override
  Future<Either<Failure, UserData>> login(UserData data) async {
    return getEither(() => authenticationApi
        .login(UserDataModel(email: data.email, password: data.password)));
  }

  @override
  Future<Either<Failure, void>> loginViaIstuAcc() {
    // TODO: implement loginViaIstuAcc
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserData>> registration(UserData data) {
    assert(data.firstName != null && data.lastName != null);
    return getEither(() => authenticationApi.registration(UserDataModel(
        email: data.email,
        password: data.password,
        firstName: data.firstName,
        lastName: data.lastName)));
  }
}
