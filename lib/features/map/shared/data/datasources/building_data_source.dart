import 'package:dio/dio.dart';
import 'package:istu_map/core/constants/api_constants.dart';
import 'package:istu_map/features/map/shared/data/models/building_model.dart';
import 'package:retrofit/http.dart';

part 'building_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BuildingApi {
  factory BuildingApi(Dio dio, {String baseUrl}) = _BuildingApi;

  @GET(ApiConstants.buildings)
  Future<List<BuildingModel>> getAll();
}
