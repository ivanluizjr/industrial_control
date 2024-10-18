import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tractian/core/%20routes/routes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tractian',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.homePage,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // onGenerateRoute: Routes.generateRoute,
    );
  }
}
