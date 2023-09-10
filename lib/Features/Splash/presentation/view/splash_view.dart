import 'dart:async';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer timer;
  _nextPage() => MyApp.navigation.navigateAndFinish(AppRouter.loginView);
  _delay() {
    timer = Timer(const Duration(seconds: 3), () => _nextPage());
  }

  @override
  void initState() {
    super.initState();
    _delay();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Column(
        children: [
          SizedBox(height: 150.h),
          Center(
            child: Image.asset(
              'assets/images/ring-ring.png',
              height: 300,
            ),
          ),
          const CustomText(
            text: 'Call Me',
            fontType: FontType.medium60,
            color: AppColors.mainColor,
          )
        ],
      ),
    );
  }
}
