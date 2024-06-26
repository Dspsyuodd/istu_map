import 'package:dio/dio.dart';
import 'package:istu_map/config/constants/api_constants.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/floor.dart';
import 'package:istu_map/features/map/internal_map/domain/entities/route_floor.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'floor_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl + ApiConstants.buildings)
abstract class FloorApi {
  factory FloorApi(Dio dio) = _FloorApi;

  @GET("{buildingId}/${ApiConstants.floors}{floorNumber}")
  Future<Floor> getFloor(
    @Path("buildingId") String buildingId,
    @Path("floorNumber") int floorNumber,
  );

  @POST(ApiConstants.routes)
  Future<InternalRoute> createRoute(@Body() RouteRequest requestOptions);
}

class RouteRequest {
  final String fromId;
  final String toId;

  RouteRequest({required this.fromId, required this.toId});

  Map<String, dynamic> toJson() {
    return {
      'fromId': fromId,
      'toId': toId,
    };
  }
}
