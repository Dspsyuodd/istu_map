import 'package:dio/dio.dart';
import '../../../../config/constants/api_constants.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/entities/user_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrlNoApi)
abstract class AuthenticationApi {
  factory AuthenticationApi(Dio dio) = _AuthenticationApi;

  @POST(ApiConstants.api + ApiConstants.users + ApiConstants.login)
  Future<UserData> login(@Body() UserDto data);

  @POST(ApiConstants.api + ApiConstants.users + ApiConstants.register)
  Future<UserDto> registration(@Body() UserDto data);

  @GET(ApiConstants.oauth + ApiConstants.callback)
  Future<UserData> loginViaIstuAcc(@Query("code") String code);

  @POST(ApiConstants.api + ApiConstants.users + ApiConstants.refresh)
  Future<String> refreshAccessToken(
      @Header('RefreshToken') String refreshToken);
}
