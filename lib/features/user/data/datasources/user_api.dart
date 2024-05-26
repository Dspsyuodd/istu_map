import 'package:dio/dio.dart';
import 'package:istu_map/config/constants/api_constants.dart';
import 'package:istu_map/features/user/domain/entities/lesson.dart';
import 'package:istu_map/features/user/domain/entities/user.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @GET(ApiConstants.users + ApiConstants.info)
  Future<User> getUser();

  @GET(ApiConstants.users + ApiConstants.schedule)
  Future<List<Lesson>> getShedule();
}
