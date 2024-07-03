import 'package:flutter/material.dart';
import 'package:online/nasabah/app/theme.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tams Qi Online',
      theme: appTheme,
      initialRoute: AppRoutes.splash,
      routes: AppPages.routes,
    );
  }
}
