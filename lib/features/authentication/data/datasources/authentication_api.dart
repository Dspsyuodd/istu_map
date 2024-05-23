import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/entities/user_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthenticationApi {
  factory AuthenticationApi(Dio dio) = _AuthenticationApi;

  @POST(ApiConstants.users + ApiConstants.login)
  Future<UserData> login(@Body() UserDto data);

  @POST(ApiConstants.users + ApiConstants.register)
  Future<UserDto> registration(@Body() UserDto data);

  @POST(ApiConstants.oauth + ApiConstants.authenticate)
  Future<void> loginViaIstuAcc(); 

  @POST(ApiConstants.users + ApiConstants.refresh)
  Future<String> refreshAccessToken(@Header('RefreshToken') String refreshToken);

  @GET(ApiConstants.users + ApiConstants.info) 
  Future<UserDto> getUser();
}
