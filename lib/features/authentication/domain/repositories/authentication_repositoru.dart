import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/authentication/domain/entities/user_data.dart';

abstract interface class AuthenticationRepository {
  Future<Either<Failure, UserData>> login(UserData data);
  Future<Either<Failure, UserData>> registration(UserData data);
  Future<Either<Failure, void>> loginViaIstuAcc();
}