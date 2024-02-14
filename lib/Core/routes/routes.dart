import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Auth/presentation/view/login_view.dart';
import 'package:call/Features/Chat/presentation/view/chat_view.dart';
import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:call/Features/Contacts/presentation/view/contacts_view.dart';
import 'package:call/Features/Home/presentation/view/home_view.dart';
import 'package:call/Features/Profile/presentation/view/profile_view.dart';
import 'package:call/Features/Register/presentation/view/register_view.dart';
import 'package:call/Features/Splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splashView = "splashView";
  static const String loginView = "loginView";
  static const String registerView = "registerView";
  static const String homeView = "homeView";
  static const String profileView = "profileView";
  static const String contactsView = "contactsView";
  static const String chatView = "chatView";

  final GoRouter router = GoRouter(
    initialLocation: AppStrings.userId != null ? "/homeView" : "/loginView",
    navigatorKey: MyApp.navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: "/splashView",
        name: AppRoutes.splashView,
        pageBuilder: (context, state) {
          //Prints.route('Navigation ==> $Path');
          return _customAnimation(const SplashView());
        },
      ),
      GoRoute(
        path: "/loginView",
        name: AppRoutes.loginView,
        pageBuilder: (context, state) {
          //Prints.route('Navigation ==> $Path');
          return _customAnimation(const LoginView());
        },
      ),
      GoRoute(
        path: "/registerView",
        name: AppRoutes.registerView,
        pageBuilder: (context, state) {
          //Prints.route('Navigation ==> $Path');
          return _customAnimation(const RegisterView());
        },
      ),
      GoRoute(
        path: "/homeView",
        name: AppRoutes.homeView,
        pageBuilder: (context, state) {
          //Prints.route('Navigation ==> $Path');
          return _customAnimation(const HomeView());
        },
      ),
      GoRoute(
        path: "/profileView",
        name: AppRoutes.profileView,
        pageBuilder: (context, state) {
          //Prints.route('Navigation ==> $ProfileView');
          return _customAnimation(const ProfileView());
        },
      ),
      GoRoute(
        path: "/contactsView",
        name: AppRoutes.contactsView,
        pageBuilder: (context, state) {
          //Prints.route('Navigation ==> $Path');
          return _customAnimation(const ContactsView());
        },
      ),
      GoRoute(
        path: "/chatView",
        name: AppRoutes.chatView,
        pageBuilder: (context, state) {
          //Prints.route('Navigation ==> $Path');
          final ContactModel model = state.extra as ContactModel;
          return _customAnimation(ChatView(contactModel: model));
        },
      ),
    ],
  );
}

CustomTransitionPage _customAnimation(Widget child) {
  return CustomTransitionPage(
    // transitionDuration: const Duration(seconds: 1),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.0;
      var end = 1.0;
      var tween = Tween(begin: begin, end: end);
      var caurvesanimation =
          CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
      return ScaleTransition(
        scale: tween.animate(caurvesanimation),
        child: child,
      );
    },
  );
}
