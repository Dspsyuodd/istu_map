import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/search/domain/entities/search_result.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, SearchResult>> search(String text, {int? limit});
  Future<Either<Failure, SearchResult>> searchByObjectType(int type);
}
