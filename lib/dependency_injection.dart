import 'package:get_it/get_it.dart';
import 'package:lanuz_app/presentation/cubit/Authentication/authentication_cubit.dart';

import 'data/logic/remote_datasource.dart';
import 'data/repository/repository_impl.dart';
import 'domain/repository/repository.dart';
import 'domain/usecase/create_table.dart';
import 'domain/usecase/login_user.dart';
import 'domain/usecase/register_user.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => AuthenticationCubit(sl(), sl(), sl()));
  sl.registerLazySingleton(() => RegisterUser(repo: sl()));
  sl.registerLazySingleton(() => LoginUser(repo: sl()));
  sl.registerLazySingleton(() => CreateTable(repo: sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remote: sl()));
}
