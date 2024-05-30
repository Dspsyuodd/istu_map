import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/core/errors/server_errors_handler.dart';
import 'package:istu_map/features/search/data/datasources/search_api.dart';
import 'package:istu_map/features/search/domain/entities/search_result.dart';
import 'package:istu_map/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl extends ExceptionsHandler
    implements SearchRepository {
  final SearchApi searchApi;

  SearchRepositoryImpl(this.searchApi, super.networkInfo);
  @override
  Future<Either<Failure, SearchResult>> search(String text, {int? limit}) {
    return getEither(() => searchApi.search(text: text, limit: limit));
  }
}
