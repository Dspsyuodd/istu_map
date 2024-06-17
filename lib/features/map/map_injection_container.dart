import 'package:get_it/get_it.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/get_route_to_lesson.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/get_route_to_object.dart';
import 'package:istu_map/features/map/internal_map/data/datasources/floor_api.dart';
import 'package:istu_map/features/shared/data/datasources/image_api.dart';
import 'package:istu_map/features/map/internal_map/data/datasources/image_local_data_source.dart';
import 'package:istu_map/features/map/internal_map/data/repositories/floor_repository_impl.dart';
import 'package:istu_map/features/shared/data/repositories/image_repository_impl.dart';
import 'package:istu_map/features/map/internal_map/domain/repositories/floor_repository.dart';
import 'package:istu_map/features/shared/domain/repositories/image_repository.dart';
import 'package:istu_map/features/map/internal_map/domain/usecases/create_route.dart';
import 'package:istu_map/features/map/internal_map/domain/usecases/load_floor.dart';
import 'package:istu_map/features/map/internal_map/presintation/bloc/building_map_bloc.dart';
import 'external_map/data/datasources/extertnal_route_api.dart';
import 'external_map/data/repositories/external_route_repository_impl.dart';
import 'external_map/data/repositories/geoposition_repository_impl.dart';
import 'external_map/domain/repositories/external_route_repository.dart';
import 'external_map/domain/repositories/geoposition_repository.dart';
import 'external_map/domain/usecases/get_route.dart';
import 'external_map/domain/usecases/load_map.dart';
import 'external_map/presentation/bloc/map_bloc.dart';
import 'shared/data/datasources/building_data_source.dart';
import 'shared/data/repositories/building_repository_impl.dart';
import 'shared/domain/repositories/building_repository.dart';

final sl = GetIt.instance;

void initMapDependencies() {
  sl.registerFactory(() => MapBloc(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => BuildingMapBloc(sl(), sl()));

  sl.registerLazySingleton(() => GetRouteToObject(sl(), sl()));
  sl.registerLazySingleton(() => GetRouteToLesson(sl(), sl()));
  sl.registerLazySingleton(() => GetExternalRoute(sl()));
  sl.registerLazySingleton(() => LoadMap(sl()));
  sl.registerLazySingleton(() => LoadFloor(sl(), sl()));
  sl.registerLazySingleton(() => CreateRoute(sl()));

  sl.registerLazySingleton<ExternalRouteRepository>(
      () => ExternalRouteRepositoryImpl(sl(), sl()));
  sl.registerFactory<BuildingRepository>(
      () => BuildingRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<GeopositionRepository>(
      () => GeopositionRepositoryImpl());
  sl.registerLazySingleton<FloorRepository>(
      () => FloorRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<ImageRepository>(
      () => ImageRepositoryImpl(sl(), sl(), sl()));

  sl.registerLazySingleton(() => ExternalRouteApi(sl()));
  sl.registerLazySingleton(() => BuildingApi(sl()));
  sl.registerLazySingleton(() => FloorApi(sl()));
  sl.registerLazySingleton(() => ImageApi(sl()));
  sl.registerLazySingleton<ImageLocalDataSource>(
      () => ImageLocalDataSourceImpl());
}
