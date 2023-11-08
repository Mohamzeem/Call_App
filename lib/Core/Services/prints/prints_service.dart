import 'dart:developer';
import 'package:ansicolor/ansicolor.dart';

class Prints {
  factory Prints() {
    return _instance;
  }
  Prints._();

  static final Prints _instance = Prints._();
  static AnsiPen fnSuccess = AnsiPen()..xterm(042);
  static AnsiPen fnError = AnsiPen()..xterm(009);
  static AnsiPen fnRoute = AnsiPen()..xterm(013);
  static AnsiPen fndebug = AnsiPen()..xterm(214);
  static AnsiPen fndstates = AnsiPen()..xterm(45);

//! successful
  static void success({required String? endPoint, required String? message}) {
    ansiColorDisabled = false;
    log(
      _printMessage('EndPoint:- $endPoint', message, fnSuccess, '🟢 SUCCESS'),
    );
  }

//! error
  static void error({required String? endPoint, String? message}) {
    ansiColorDisabled = false;
    log(
      _printMessage('EndPoint:- $endPoint', message, fnError, '🔴 ERROR'),
    );
  }

//! route
  static void route(String? message) {
    ansiColorDisabled = false;
    log(fnRoute('🟣 ROUTE Name:- $message'));
  }

//! debug
  static void debug({required String message}) {
    ansiColorDisabled = false;
    log(_printMessage('Result:-', message, fndebug, '🟠 DEBUG'));
  }

//! state management
  static void states({required String message}) {
    ansiColorDisabled = false;
    log(fndstates('STATES:- $message'));
  }

// To handle the Message Prints
  static String _printMessage(
    String title,
    String? message,
    AnsiPen ansiPen,
    String emoji,
  ) {
    final status = ansiPen(emoji);
    final titleIfo = ansiPen(title);
    final dvider1 = ansiPen('___________________________________________');
    final messagesInfo = ansiPen('$message');
    final dvider2 = ansiPen('___________________________________________');
    final result = '$status\n$titleIfo\n$dvider1\n$messagesInfo\n$dvider2';
    return result;
  }
}
