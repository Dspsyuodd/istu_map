import 'package:dio/dio.dart';
import '../../../../../config/constants/api_constants.dart';
import '../../domain/entities/exteral_route.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'extertnal_route_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ExternalRouteApi {
  factory ExternalRouteApi(Dio dio, {String baseUrl}) = _ExternalRouteApi;

  @POST(ApiConstants.externalRoutes)
  Future<ExternalRoute> getRoute(
    @Body() Map<String, dynamic> body,
  );
}