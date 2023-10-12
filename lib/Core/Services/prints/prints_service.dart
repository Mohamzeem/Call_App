import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/material.dart';

class Prints {
  Prints._();

//~ successful
  static void success({String? endPoint, required String? message}) {
    ansiColorDisabled = false;
    debugPrint(kGreen(message!));
  }

  //~ error
  static void error({String? endPoint, required String? message}) {
    ansiColorDisabled = false;
    debugPrint(kRed(message!));
  }

  //~ route
  static void route({required String? message}) {
    ansiColorDisabled = false;
    debugPrint(kOrange('Navigation: ${message!}'));
  }

  //~ debug print
  static void debug({required String? message}) {
    ansiColorDisabled = false;
    debugPrint(kWhite(message!));
  }

  static AnsiPen kGreen = AnsiPen()..xterm(042); //* Green
  static AnsiPen kRed = AnsiPen()..xterm(009); //* Red
  static AnsiPen kPink = AnsiPen()..xterm(013); //* Pink
  static AnsiPen kOrange = AnsiPen()..xterm(214); //* Orange
  static AnsiPen kWhite = AnsiPen()..xterm(015); //* Orange

  //! https://pub.dev/packages/ansicolor
}



// import 'dart:developer';
// import 'package:ansicolor/ansicolor.dart';

// class Prints {
//   factory Prints() {
//     return _instance;
//   }

//   Prints._();
//   static final Prints _instance = Prints._();
//   static AnsiPen fnSuccess = AnsiPen()..xterm(042);
//   static AnsiPen fnError = AnsiPen()..xterm(009);
//   static AnsiPen fnRoute = AnsiPen()..xterm(013);
//   static AnsiPen fndebug = AnsiPen()..xterm(214);

// //! successful
//   static void success({required String? endPoint, required String? message}) {
//     ansiColorDisabled = false;

//     log(
//       _printMessage('EndPoint:- $endPoint', message, fnSuccess, '🟢 SUCCESS'),
//     );
//   }

// //! error
//   static void error({required String? endPoint, String? message}) {
//     ansiColorDisabled = false;

//     log(
//       _printMessage('EndPoint:- $endPoint', message, fnError, '🔴 ERROR'),
//     );
//   }

// //! route
//   static void route(String? message) {
//     ansiColorDisabled = false;

//     log(fnRoute('🟣 ROUTE Name:- $message'));
//   }

// //! debug
//   static void debug({required String message}) {
//     ansiColorDisabled = false;

//     log(_printMessage('Result:-', message, fndebug, '🟠 DEBUG'));
//   }

// // To handle the Message Prints
//   static String _printMessage(
//     String title,
//     String? message,
//     AnsiPen ansiPen,
//     String emoji,
//   ) {
//     final status = ansiPen(emoji);
//     final titleIfo = ansiPen(title);
//     final dvider1 = ansiPen('___________________________________________');
//     final messagesInfo = ansiPen('$message');
//     final dvider2 = ansiPen('___________________________________________');
//     final result = '$status\n$titleIfo\n$dvider1\n$messagesInfo\n$dvider2';
//     return result;
//   }
// }

