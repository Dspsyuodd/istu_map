import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user_data.dart';
import '../entities/user_dto.dart';

abstract interface class AuthenticationRepository {
  Future<Either<Failure, UserData>> login(UserDto data);
  Future<Either<Failure, UserDto>> registration(UserDto data);
  Future<Either<Failure, UserData>> loginViaIstuAcc(String code);
}