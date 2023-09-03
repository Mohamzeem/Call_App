import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/App/app_injector.dart';
import 'package:call/Core/Utils/app_theme.dart';
import 'package:call/Core/routes/app_navigation.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MyApp.config.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GestureDetector(
        onTap: () => MyApp.navigation.unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: MyApp.appName,
          theme: appTheme(),
          navigatorKey: sl.get<AppNavigation>().navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.homeView,
        ),
      ),
    );
  }
}
