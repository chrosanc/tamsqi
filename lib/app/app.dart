import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tams Qi Online',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: AppRoutes.first_landing,
      routes: AppPages.routes,
    );
  }
}
