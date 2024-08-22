import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:istu_map/features/authentication/domain/usecases/logout.dart';
import 'core/authentication_interceptor.dart';
import 'data/datasources/authentication_api.dart';
import 'data/repositories/authentication_repository_impl.dart';
import 'data/repositories/token_repository_impl.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/repositories/token_repository.dart';
import 'domain/usecases/initialize.dart';
import 'domain/usecases/login.dart';
import 'domain/usecases/login_via_istu_acc.dart';
import 'domain/usecases/register.dart';
import 'presentation/bloc/authentication_bloc.dart';

final sl = GetIt.instance;

void initAuthenticationDependencies() {
  sl.registerFactory(() => AuthenticationBloc(sl(), sl(), sl(), sl(), sl()));

  sl.registerLazySingleton(() => InitializeTokens(sl(), sl()));
  sl.registerLazySingleton(() => Login(sl(), sl()));
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => LoginViaIstuAcc(sl(), sl()));
  sl.registerLazySingleton(() => Logout(sl()));

  sl.registerLazySingleton(() => AuthenticationInterceptor(sl()));

  sl.registerLazySingleton<TokenRepository>(
      () => TokenRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => AuthenticationApi(sl()));

  sl.registerLazySingleton(() => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      ));
}
