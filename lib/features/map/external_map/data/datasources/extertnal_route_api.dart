import 'package:dio/dio.dart';
import 'package:istu_map/core/constants/api_constants.dart';
import 'package:istu_map/features/map/external_map/data/models/external_route_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'extertnal_route_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ExternalRouteApi {
  factory ExternalRouteApi(Dio dio, {String baseUrl}) = _ExternalRouteApi;

  @POST(ApiConstants.externalRoutes)
  Future<ExternalRouteModel> getRoute(
    @Body() Map<String, dynamic> body,
  );
}
// @Field('Type') int type,
// @Field('BuildingId') String buildingId,
// @Field('StartPointDto') Map<String, dynamic> startPointDto,