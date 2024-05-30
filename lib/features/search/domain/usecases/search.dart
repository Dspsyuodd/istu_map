import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/search/domain/entities/search_result.dart';
import 'package:istu_map/features/search/domain/repository/search_repository.dart';

class SearchUsecase extends Usecase<SearchResult, SearchParams> {
  final SearchRepository repository;

  SearchUsecase(this.repository);
  @override
  Future<Either<Failure, SearchResult>> call(SearchParams params) {
    return repository.search(params.text, limit: params.limit);
  }
}

class SearchParams extends NoParams {
  final String text;
  final int? limit;

  SearchParams({required this.text, this.limit});

  @override
  List<Object?> get props => [text, limit];
}
