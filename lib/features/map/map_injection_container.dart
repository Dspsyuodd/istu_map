import 'package:get_it/get_it.dart';
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
  sl.registerFactory(() => MapBloc(sl(), sl(), sl()));

  sl.registerLazySingleton(() => GetExternalRoute(sl()));
  sl.registerLazySingleton(() => LoadMap(sl()));

  sl.registerLazySingleton<ExternalRouteRepository>(
      () => ExternalRouteRepositoryImpl(sl(), sl()));
  sl.registerFactory<BuildingRepository>(
      () => BuildingRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<GeopositionRepository>(
      () => GeopositionRepositoryImpl());

  sl.registerLazySingleton(() => ExternalRouteApi(sl()));
  sl.registerLazySingleton(() => BuildingApi(sl()));
}
