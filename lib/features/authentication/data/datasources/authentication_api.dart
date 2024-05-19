import 'package:dio/dio.dart';
import 'package:istu_map/core/constants/api_constants.dart';
import 'package:istu_map/features/authentication/data/models/user_data_model.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthenticationApi {
  factory AuthenticationApi(Dio dio) = _AuthenticationApi;

  @POST(ApiConstants.users + ApiConstants.login)
  Future<UserDataModel> login(@Body() UserDataModel data);

  @POST(ApiConstants.users + ApiConstants.register)
  Future<UserDataModel> registration(@Body() UserDataModel data);

  @POST(ApiConstants.oauth + ApiConstants.authenticate)
  Future<void> loginViaIstuAcc(); 
}
