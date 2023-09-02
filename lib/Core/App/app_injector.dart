import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/routes/app_navigation.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
// core
  sl.registerLazySingleton(() => AppNavigation());
  sl.registerLazySingleton(() => AppConfig());
}
