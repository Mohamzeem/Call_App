import 'package:call/Core/App/app.dart';
import 'package:call/Core/App/app_injector.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const App());
}
