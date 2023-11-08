import 'package:ansicolor/ansicolor.dart';
import 'package:call/Core/Services/prints/prints_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  AnsiPen pen = AnsiPen()
    ..white()
    ..xterm(051);

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Prints.states(message: 'onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Prints.states(message: 'onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Prints.states(message: 'onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Prints.states(message: 'onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Prints.states(message: 'onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Prints.states(message: 'onClose -- ${bloc.runtimeType}');
  }
}
