import 'package:fpdart/fpdart.dart';
import 'package:istu_map/core/domain/usecases/usecase.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/search/domain/entities/search_result.dart';
import 'package:istu_map/features/search/domain/repository/search_repository.dart';

class SearchByObjectType
    extends Usecase<SearchResult, SearchByObjectTypeParams> {
  final SearchRepository repository;

  SearchByObjectType(this.repository);
  @override
  Future<Either<Failure, SearchResult>> call(SearchByObjectTypeParams params) {
    return repository.searchByObjectType(params.type);
  }
}

class SearchByObjectTypeParams extends NoParams {
  final int type;

  SearchByObjectTypeParams({required this.type});

  @override
  List<Object?> get props => [type];
}
