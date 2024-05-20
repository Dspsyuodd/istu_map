import 'package:get_it/get_it.dart';
import 'package:istu_map/features/authentication/data/datasources/authentication_api.dart';
import 'package:istu_map/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:istu_map/features/authentication/domain/repositories/authentication_repositoru.dart';
import 'package:istu_map/features/authentication/domain/usecases/login.dart';
import 'package:istu_map/features/authentication/domain/usecases/login_via_istu_acc.dart';
import 'package:istu_map/features/authentication/domain/usecases/register.dart';
import 'package:istu_map/features/authentication/presentation/bloc/authentication_bloc.dart';

final sl = GetIt.instance;

void initAuthenticationDependencies() {
  sl.registerFactory(() => AuthenticationBloc(sl(), sl(), sl()));

  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => LoginViaIstuAcc(sl()));

  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => AuthenticationApi(sl()));
}
