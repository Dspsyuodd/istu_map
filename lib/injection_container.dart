import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:istu_map/core/errors/network_info.dart';
import 'package:istu_map/features/authentication/authentication_injection_container.dart';
import 'package:istu_map/features/authentication/core/authentication_interceptor.dart';
import 'package:istu_map/features/map/map_injection_container.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

void initDependencies() {
  initAuthenticationDependencies();
  initMapDependencies();

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  var dio = Dio();
  dio.options.headers['content-Type'] = 'application/json';
  sl.registerLazySingleton(() => dio);

  sl.registerLazySingleton(() => InternetConnection());
  dio.interceptors.addAll([
    sl<AuthenticationInterceptor>(),
    PrettyDioLogger(requestBody: true)
  ]);
}
