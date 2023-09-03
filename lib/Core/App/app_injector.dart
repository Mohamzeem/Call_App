import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/routes/app_navigation.dart';
import 'package:call/Features/Auth/data/repo/auth_api.dart';
import 'package:call/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
// Core
  sl.registerLazySingleton(() => AppNavigation());
  sl.registerLazySingleton(() => AppConfig());

// Auth
  sl.registerLazySingleton<AuthApi>(() => AuthApi());
  sl.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(api: sl()));
}
