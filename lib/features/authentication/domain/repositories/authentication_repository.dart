import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';

abstract interface class AuthenticationRepository {
  Future<Either<Failure, UserData>> login(UserDto data);
  Future<Either<Failure, UserDto>> registration(UserDto data);
  Future<Either<Failure, void>> loginViaIstuAcc();
  Future<Either<Failure, UserDto>> getUser();
}