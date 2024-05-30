import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/features/search/domain/entities/search_object.dart';

part 'search_result.freezed.dart';
part 'search_result.g.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required List<SearchObject> results,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
