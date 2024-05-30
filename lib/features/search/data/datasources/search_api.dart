import 'package:dio/dio.dart';
import 'package:istu_map/config/constants/api_constants.dart';
import 'package:istu_map/features/search/domain/entities/search_result.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchApi {
  factory SearchApi(Dio dio) = _SearchApi;

  @GET(ApiConstants.cards + ApiConstants.search)
  Future<SearchResult> search({
    @Query('text') required String text,
    @Query('limit') int? limit,
  });
}
