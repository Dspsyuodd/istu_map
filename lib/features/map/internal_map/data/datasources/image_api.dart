import 'package:dio/dio.dart';
import 'package:istu_map/config/constants/api_constants.dart';
import 'package:retrofit/http.dart';

part 'image_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ImageApi {
  factory ImageApi(Dio dio, {String baseUrl}) = _ImageApi;

  @GET("${ApiConstants.images}{objectId}")
  Future<List<int>> getImageBytes(@Path("objectId") String objectId);
}
