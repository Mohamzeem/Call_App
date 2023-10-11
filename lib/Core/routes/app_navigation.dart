import 'package:call/Core/Services/prints/prints_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppNavigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName, {dynamic args}) {
    debugPrint(
        "### NAVIGATION ### - NAVIGATE TO ==> ${routeName.toUpperCase()}");
    return navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }

  Future<dynamic>? navigateAndFinish(String routeName, {dynamic args}) {
    debugPrint(
        "### NAVIGATION ### - NAVIGATE&FINISH ==> ${routeName.toUpperCase}");
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      arguments: args,
      (route) => false,
    );
  }

  Future<dynamic>? rootNavigatorTo(
      BuildContext context, String routeName, bool rootNavigator,
      {dynamic args}) {
    debugPrint(
        "### NAVIGATION ### - ROOTNAVIATORTO ==> ${routeName.toUpperCase}");
    return Navigator.of(context, rootNavigator: rootNavigator)
        .pushNamed(routeName, arguments: args);
  }

  void goBack<T>({T? result}) {
    debugPrint("### NAVIGATION ### - CLOSE & BACK");
    Prints.print('Close & Back');
    return navigatorKey.currentState?.pop<T>(result);
  }

  void unfocus() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
