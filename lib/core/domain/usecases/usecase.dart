import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../errors/failure.dart';

abstract class Usecase<Type, Params extends NoParams> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
