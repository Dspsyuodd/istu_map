import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/core/errors/failure.dart';
import 'package:istu_map/features/search/domain/entities/search_result.dart';
import 'package:istu_map/features/search/domain/usecases/search.dart';
import 'package:istu_map/features/search/domain/usecases/search_by_object_type.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUsecase searchUsecase;
  final SearchByObjectType searchByObjectTypeUsecase;
  SearchCubit(this.searchUsecase, this.searchByObjectTypeUsecase)
      : super(const SearchState.initial());

  void search(String text, {int? limit}) async {
    if (text.isEmpty) {
      emit(const SearchState.initial());
      return;
    }
    emit(const SearchState.loading());
    var searchResultEither =
        await searchUsecase(SearchParams(text: text, limit: limit));
    searchResultEither.fold(
        (l) => _emitError(l, emit), (r) => emit(SearchState.searchSuccess(r)));
  }

  void searchByObjectType(int type) async {
    emit(const SearchState.loading());
    var searchResultEither =
        await searchByObjectTypeUsecase(SearchByObjectTypeParams(type: type));
    searchResultEither.fold(
        (l) => _emitError(l, emit), (r) => emit(SearchState.searchSuccess(r)));
  }

  void _emitError(Failure l, void Function(SearchState) emit) {
    if (l is UnknownFailure) {
      log(l.message);
      log(l.stackTrace);
    }
    if (l is ServerFailure) {
      log(l.message);
    }
  }
}
