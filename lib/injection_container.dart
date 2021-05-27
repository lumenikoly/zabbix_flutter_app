import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:zabbix_flutter_app/features/data/datasources/remote_data_source.dart';
import 'core/platform/network_info.dart';
import 'features/data/datasources/local_data_source.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import 'features/domain/repositories/repository.dart';
import 'features/domain/repositories/repository_impl.dart';
import 'features/domain/usecase/get_auth_key.dart';
import 'features/presentation/bloc/login_page_bloc/login_page_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Bloc
  sl.registerFactory(() => LoginPageBloc(getAuthKey: sl()));

  ///Use cases
  sl.registerLazySingleton(() => GetAuthKey(sl()));

  ///Repository
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(
      localDataSource: sl(), networkInfo: sl(), remoteDataSources: sl()));

  ///Data sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourcesImpl());

  ///Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
