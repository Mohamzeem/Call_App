import 'package:call/Core/App/app.dart';
import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/App/bloc_observer.dart';
import 'package:call/Core/Services/shared_prefs/pref_key.dart';
import 'package:call/Core/Services/shared_prefs/shared_pref.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyApp.setSystemUi();
  await SharedPref().initPreferences();
  AppStrings.userId = SharedPref().getString(key: PrefKeys.userId);
  await setupDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(MyApp.navigatorKey);
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
    runApp(const App());
  });
}
