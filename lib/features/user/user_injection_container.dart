import 'package:get_it/get_it.dart';
import 'package:istu_map/features/user/data/datasources/user_api.dart';
import 'package:istu_map/features/user/data/repositories/user_repository_impl.dart';
import 'package:istu_map/features/user/domain/repositories/user_repository.dart';
import 'package:istu_map/features/user/domain/usecases/get_shedule.dart';
import 'package:istu_map/features/user/domain/usecases/init_user.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

void initUserDependencies() {
  sl.registerFactory(() => UserBloc(sl(), sl()));

  sl.registerLazySingleton(() => GetShedule(sl()));
  sl.registerLazySingleton(() => InitUser(sl()));

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => UserApi(sl()));
}
