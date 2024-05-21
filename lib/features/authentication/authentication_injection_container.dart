import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:istu_map/features/authentication/core/authentication_interceptor.dart';
import 'package:istu_map/features/authentication/data/datasources/authentication_api.dart';
import 'package:istu_map/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:istu_map/features/authentication/data/repositories/token_repository_impl.dart';
import 'package:istu_map/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:istu_map/features/authentication/domain/repositories/token_repository.dart';
import 'package:istu_map/features/authentication/domain/usecases/initialize.dart';
import 'package:istu_map/features/authentication/domain/usecases/login.dart';
import 'package:istu_map/features/authentication/domain/usecases/login_via_istu_acc.dart';
import 'package:istu_map/features/authentication/domain/usecases/register.dart';
import 'package:istu_map/features/authentication/presentation/bloc/authentication_bloc.dart';

final sl = GetIt.instance;

void initAuthenticationDependencies() {
  sl.registerFactory(() => AuthenticationBloc(sl(), sl(), sl(), sl()));

  sl.registerLazySingleton(() => Initialize(sl(), sl()));
  sl.registerLazySingleton(() => Login(sl(), sl()));
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => LoginViaIstuAcc(sl()));

  sl.registerLazySingleton(() => AuthenticationInterceptor(sl()));

  sl.registerLazySingleton<TokenRepository>(
      () => TokenRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => AuthenticationApi(sl()));

  sl.registerLazySingleton(() => const FlutterSecureStorage());
}
