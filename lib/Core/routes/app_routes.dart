import 'package:call/Core/routes/base_routes.dart';
import 'package:call/Features/Home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static const String homeView = "homeView";

  static Route<void> onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case homeView:
        return BaseRoute(const HomeView());
      // case loginView:
      //   return BaseRoute(const LoginView());
      // case forgotPasswordView:
      //   return BaseRoute(const ForgotPasswordView());
      // case controlView:
      //   return BaseRoute(const ControlView());
      // case coachProfileView:
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
      // case growModelView:
      //   return BaseRoute(const GrowModView());
      // case growModelDetailsView:
      //   return BaseRoute(const DetailsGrowModView());
      // case ratingView:
      //   return BaseRoute(RatingView(
      //     userCallId: args as String,
      //   ));
      // case profileView:
      //   return BaseRoute(const ProfileView());
      // case registerView:
      //   return BaseRoute(const RegisterView());
      // case fastCoachingWebView:
      //   return BaseRoute(FastCoachingWebView(url: args as String));

      // case profileEditView:
      //   return BaseRoute(ProfileEditView(
      //     userModel: args as UserDetailsModel,
      //   ));

      // case updatePasswordView:
      //   return BaseRoute(const UpdatePasswordView());

      // case notificationsView:
      //   return BaseRoute(const NotificationsView());

      default:
        return BaseRoute(const HomeView());
    }
  }
}
