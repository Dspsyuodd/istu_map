import 'package:get_it/get_it.dart';
import 'package:istu_map/features/search/data/datasources/search_api.dart';
import 'package:istu_map/features/search/data/repositories/search_repository_impl.dart';
import 'package:istu_map/features/search/domain/repository/search_repository.dart';
import 'package:istu_map/features/search/domain/usecases/search.dart';
import 'package:istu_map/features/search/domain/usecases/search_by_object_type.dart';
import 'package:istu_map/features/search/presentation/cubit/search_cubit.dart';

final sl = GetIt.instance;

void initSearchDependencies() {
  sl.registerFactory(() => SearchCubit(sl(), sl()));

  sl.registerLazySingleton(() => SearchUsecase(sl()));
  sl.registerLazySingleton(() => SearchByObjectType(sl()));

  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => SearchApi(sl()));
}
