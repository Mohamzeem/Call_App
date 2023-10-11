import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class Prints {
  Prints._();

  static void printError(String text) {
    debugPrint('\x1B[31m $text \x1B[0m');
  }

  static void print(String msg) {
    developer.log('\x1B[34m$msg\x1B[0m');
  }

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
