import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> checkInternet() async {
  //~ Check internet connection with singleton (no custom values allowed)
  await execute(InternetConnectionChecker());

  //~ Create customized instance which can be registered via dependency injection
  final InternetConnectionChecker customInstance =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1),
    checkInterval: const Duration(seconds: 1),
  );
  //~ Check internet connection with created instance
  await execute(customInstance);
}

Future<void> execute(
  InternetConnectionChecker internetConnectionChecker,
) async {
  //~ Simple check to see if we have Internet
  //~ ignore: avoid_print
  debugPrint(
      '''#### The statement 'this machine is connected to the Internet' is: ''');
  final bool isConnected = await InternetConnectionChecker().hasConnection;
  //~ ignore: avoid_debugPrint
  debugPrint(
    isConnected.toString(),
  );
  //~ returns a bool

  //~ We can also get an enum instead of a bool
  //~ ignore: avoid_debugPrint
  debugPrint(
    '#### Current status: ${await InternetConnectionChecker().connectionStatus}',
  );
  //~ debugPrints either InternetConnectionStatus.connected
  //~ or InternetConnectionStatus.disconnected

  //~ actively listen for status updates
  final StreamSubscription<InternetConnectionStatus> listener =
      InternetConnectionChecker().onStatusChange.listen(
    (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          //~ ignore: avoid_debugPrint
          debugPrint('#### Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          //~ ignore: avoid_debugPrint
          debugPrint('#### You are disconnected from the internet.');
          break;
      }
    },
  );

  //~ close listener after 30 seconds, so the program doesn't run forever
  await Future<void>.delayed(const Duration(seconds: 30));
  await listener.cancel();
}
