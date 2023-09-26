import 'package:call/Core/App/app.dart';
import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Core/App/bloc_observer.dart';
import 'package:call/Core/Services/shared_prefs/pref_key.dart';
import 'package:call/Core/Services/shared_prefs/shared_pref.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref().initPreferences();
  AppStrings.userId = SharedPref().getString(key: PrefKeys.userId);
  await setupDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
