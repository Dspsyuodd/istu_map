
import 'package:dio/dio.dart';
import 'package:istu_map/core/constants/api_constants.dart';
import 'package:istu_map/features/map/external_map/data/models/external_route_model.dart';
import 'package:retrofit/retrofit.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ExternalRouteApi {
  factory ExternalRouteApi(Dio dio, {String baseUrl}) = _ExternalRouteApi;

  @POST(ApiConstants.externalRoutes)
  Future<ExternalRouteModel> getRoute();
}