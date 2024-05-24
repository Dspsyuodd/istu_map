import 'package:dio/dio.dart';
import '../../../../../config/constants/api_constants.dart';
import '../../domain/entities/building.dart';
import 'package:retrofit/http.dart';

part 'building_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BuildingApi {
  factory BuildingApi(Dio dio, {String baseUrl}) = _BuildingApi;

  @GET(ApiConstants.buildings)
  Future<List<Building>> getAll();
}
