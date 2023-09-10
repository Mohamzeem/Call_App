import 'package:call/Core/routes/base_routes.dart';
import 'package:call/Features/Auth/presentation/view/login_view.dart';
import 'package:call/Features/Control/presentation/view/control_view.dart';
import 'package:call/Features/Profile/presentation/view/profile_view.dart';
import 'package:call/Features/Register/presentation/view/register_view.dart';
import 'package:call/Features/Splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static const String splashView = "splashView";
  static const String loginView = "loginView";
  static const String registerView = "registerView";
  static const String controlView = "controlView";
  static const String profileView = "profileView";

  static Route<void> onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case splashView:
        return BaseRoute(const SplashView());
      case loginView:
        return BaseRoute(const LoginView());
      case registerView:
        return BaseRoute(const RegisterView());
      case controlView:
        return BaseRoute(const ControlView());
      case profileView:
        return BaseRoute(const ProfileView());

      default:
        return BaseRoute(const SplashView());
    }
  }
}
   //   return BaseRoute(CoachProfileView(
      //     userDetailsModel: args as UserDetailsModel,
      //   ));
      // case categoryView:
      //   return BaseRoute(
      //       CategoryView(sessionRecord: args as ({String name, String photo})));
      // case calenderView:
      //   return BaseRoute(CalenderView(
      //     userDetailsModel: args as UserDetailsModel,
      //   ));
      // case aiSearchView:
      //   return BaseRoute(AiSearchView(chatText: args as String));

      // case ratingView:
      //   return BaseRoute(RatingView(
      //     userCallId: args as String,
      //   ));

      // case fastCoachingWebView:
      //   return BaseRoute(FastCoachingWebView(url: args as String));

      // case profileEditView:
      //   return BaseRoute(ProfileEditView(
      //     userModel: args as UserDetailsModel,
      //   ));