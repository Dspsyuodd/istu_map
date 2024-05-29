import 'package:dio/dio.dart';
import 'package:istu_map/config/constants/api_constants.dart';
import 'package:istu_map/features/object_card/domain/entities/comment.dart';
import 'package:istu_map/features/object_card/domain/entities/object_card.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'object_cards_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ObjectCardsApi {
  factory ObjectCardsApi(Dio dio) = _ObjectCardsApi;

  @GET("${ApiConstants.cards}{objectId}")
  Future<ObjectCard> getObjectCard(
    @Path('objectId') String objectId,
  );

  @POST("${ApiConstants.cards}{objectId}/${ApiConstants.comment}")
  Future<String> createComment(
    @Path('objectId') String objectId,
    @Query('text') String text,
  );

  @DELETE("${ApiConstants.cards}{objectId}/${ApiConstants.comment}{commentId}")
  Future<void> deleteComment(
    @Path('objectId') String objectId,
    @Path('commentId') String commentId,
  );

  @GET(ApiConstants.cards + ApiConstants.comments)
  Future<List<Comment>> getComments({
    @Query('CommentId') String? commentId,
    @Query('UserId') String? userId,
    @Query('ObjectId') String? objectId,
    @Query('Skip') int? skip,
    @Query('Take') int? take,
  });
}
