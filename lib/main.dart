import 'package:flutter/material.dart';
import 'package:tractian/app_widget.dart';
import 'package:tractian/core/di/service_locator.dart';
import 'package:tractian/core/env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final env = Env.fromString(
    const String.fromEnvironment(
      'env',
      defaultValue: 'prod',
    ),
  );
  await ServiceLocator.init(env);

  runApp(const AppWidget());
}
