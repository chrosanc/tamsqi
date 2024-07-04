import 'package:online/presentation/views/landing/landing_container.dart';
import 'package:online/presentation/views/splash/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const first_landing = '/first_landing';
  static const register_member = '/register_member';
}

class AppPages {
  static final routes = {
    AppRoutes.splash: (context) => SplashScreen(),
    AppRoutes.first_landing: (context) => LandingContainer(),
  };
}