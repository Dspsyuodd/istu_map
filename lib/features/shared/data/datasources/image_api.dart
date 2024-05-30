import 'package:dio/dio.dart';
import 'package:istu_map/config/constants/api_constants.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/image_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'image_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.baseUrl,
)
abstract class ImageApi {
  factory ImageApi(Dio dio, {String baseUrl}) = _ImageApi;

  @GET("${ApiConstants.images}{objectId}")
  Future<GetImagesResult> getImages(@Path("objectId") String objectId);

  @GET("${ApiConstants.images}${ApiConstants.download}{imageId}")
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> getImageBytes(@Path("imageId") String imageId);

  @POST("${ApiConstants.images}${ApiConstants.upload}{objectId}")
  @MultiPart()
  Future<String> uploadImage(
      @Path("objectId") String objectId, @Part() List<MultipartFile> file);
}
