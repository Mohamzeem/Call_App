import 'package:call/Core/App/app_info.dart';
import 'package:call/Features/Auth/data/repo/auth_api.dart';
import 'package:call/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:call/Features/Contacts/data/repo/contacts_api.dart';
import 'package:call/Features/Contacts/data/repo/contacts_repo_impl.dart';
import 'package:call/Features/Now%20Map/data/repo/chats_api.dart';
import 'package:call/Features/Now%20Map/data/repo/chats_repo_impl.dart';
import 'package:call/Features/Register/data/repo/register_api.dart';
import 'package:call/Features/Register/data/repo/register_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
//~ Core
  // sl.registerLazySingleton(() => AppNavigation());
  sl.registerLazySingleton(() => AppConfig());

//~ Auth
  sl.registerLazySingleton<AuthApi>(() => AuthApi());
  sl.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(api: sl()));

//~ Register
  sl.registerLazySingleton<RegisterApi>(() => RegisterApi());
  sl.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl(api: sl()));

//~ contacts
  sl.registerLazySingleton<ContactsApi>(() => ContactsApi());
  sl.registerLazySingleton<ContactsRepoImpl>(() => ContactsRepoImpl(api: sl()));

//!
//~ chats
  sl.registerLazySingleton<ChatsApi>(() => ChatsApi());
  sl.registerLazySingleton<ChatsRepoImpl>(() => ChatsRepoImpl(api: sl()));

//~ shared preferences
  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);
}
