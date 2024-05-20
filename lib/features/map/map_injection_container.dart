import 'package:get_it/get_it.dart';
import 'package:istu_map/features/map/external_map/data/datasources/extertnal_route_api.dart';
import 'package:istu_map/features/map/external_map/data/repositories/external_route_repository_impl.dart';
import 'package:istu_map/features/map/external_map/domain/repositories/external_route_repository.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/get_route.dart';
import 'package:istu_map/features/map/external_map/domain/usecases/load_map.dart';
import 'package:istu_map/features/map/external_map/presentation/bloc/map_bloc.dart';
import 'package:istu_map/features/map/shared/data/datasources/building_data_source.dart';
import 'package:istu_map/features/map/shared/data/repositories/building_repository_impl.dart';
import 'package:istu_map/features/map/shared/domain/repositories/building_repository.dart';

final sl = GetIt.instance;

void initMapDependencies() {
  sl.registerFactory(() => MapBloc(sl(), sl()));

  sl.registerLazySingleton(() => GetExternalRoute(sl()));
  sl.registerLazySingleton(() => LoadMap(sl()));

  sl.registerLazySingleton<ExternalRouteRepository>(
      () => ExternalRouteRepositoryImpl(sl(), sl()));
  sl.registerFactory<BuildingRepository>(
      () => BuildingRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => ExternalRouteApi(sl()));
  sl.registerLazySingleton(() => BuildingApi(sl()));
}
