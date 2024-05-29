import 'package:dio/dio.dart';
import 'package:istu_map/features/map/shared/domain/entities/waypoint.dart';
import '../../../../../config/constants/api_constants.dart';
import '../../domain/entities/building.dart';
import 'package:retrofit/http.dart';

part 'building_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BuildingApi {
  factory BuildingApi(Dio dio, {String baseUrl}) = _BuildingApi;

  @GET(ApiConstants.buildings)
  Future<List<Building>> getAll();

  @GET("${ApiConstants.buildings}{buildingId}")
  Future<Building> getBulding(@Path("buildingId") String buildingId);

  @GET("${ApiConstants.buildings}${ApiConstants.objects}{objectId}")
  Future<Waypoint> getObject(@Path("objectId") String objectId);
}
