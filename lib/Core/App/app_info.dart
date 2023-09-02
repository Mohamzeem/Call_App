import 'package:call/Core/App/app_injector.dart';
import 'package:call/Core/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyApp {
  MyApp._();
  static AppNavigation get navigation => sl.get<AppNavigation>();

  static BuildContext get context =>
      sl.get<AppNavigation>().navigatorKey.currentContext!;

  static AppConfig get config => sl.get<AppConfig>();
  static String appName = 'Call Me';

  // static AppLocalizations? get locale => AppLocalizations.of(MyApp.context);

  // static String translate(String langkey) {
  //   return locale!.translate(langkey).toString();
  // }

///// to get employee or coach roles
//   static bool get isRoleEmployee {
//     if (AppStrings.role == "Employee"){
//       return true;
//     }
//     return false;
//   }
}

class AppConfig {
  AppConfig();
  final Size designSize = const Size(411.42857142857144, 867.4285714285714);
  final fontFamily = "Cairo";
}

// to get system app info and app version build
class AppInfoUtil {
  Future<String> getAppVersion(BuildContext context) async {
    String buildNumberText = "";
    var packageInfo = await PackageInfo.fromPlatform();
    buildNumberText = '${packageInfo.version} (${packageInfo.buildNumber})';
    return buildNumberText;
  }
}
