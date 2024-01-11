// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:call/Core/App/app_bloc_providers.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_theme.dart';
import 'package:call/Core/routes/routes.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProvider,
      child: ScreenUtilInit(
        designSize: MyApp.config.designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: MyApp.appName,
              theme: appTheme(),
              routerConfig: AppRoutes().router,
              // builder: (BuildContext context, Widget? child) {
              //   return Stack(
              //     children: [
              //       child!,

              //       /// support minimizing
              //       ZegoUIKitPrebuiltCallMiniOverlayPage(
              //         contextQuery: () {
              //           return MyApp.navigatorKey.currentState!.context;
              //         },
              //       ),
              //     ],
              //   );
              // },
            ),
          );
        },
      ),
    );
  }
}
