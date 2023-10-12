import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  AnsiPen pen = AnsiPen()
    ..white()
    ..xterm(051);

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint(pen('onCreate -- ${bloc.runtimeType}'));
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint(pen('onEvent -- ${bloc.runtimeType}, $event'));
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(pen('onChange -- ${bloc.runtimeType}, $change'));
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(pen('onTransition -- ${bloc.runtimeType}, $transition'));
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(pen('onError -- ${bloc.runtimeType}, $error'));
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint(pen('onClose -- ${bloc.runtimeType}'));
  }
}
