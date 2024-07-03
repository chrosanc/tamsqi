import 'package:online/presentation/views/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';
}

class AppPages {
  static final routes = {
    AppRoutes.splash: (context) => SplashScreen(),
  };
}