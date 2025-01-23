import 'package:online/presentation/views/landing/landing_container.dart';
import 'package:online/presentation/views/member/main/navigation.dart';
import 'package:online/presentation/views/member/member_registration_screen.dart';
import 'package:online/presentation/views/splash/splash_screen.dart';
import 'package:online/presentation/views/success/credit_success_screen.dart';
import 'package:online/presentation/views/success/member_registration_success_screen.dart';
import 'package:online/presentation/views/auth/login_screen.dart';
import 'package:online/presentation/views/main/navigation.dart';

class AppRoutes {
  static const splash = '/splash';
  static const first_landing = '/first_landing';
  static const register_member = '/register_member';
  static const login = '/login';
  static const userHome = '/user/home';
  static const unverifiedHome = '/user/unverified/home';
  static const member_registration_success = '/member_registration_success';
  static const credit_request_success = '/credit_request_success';

}

class AppPages {
  static final routes = {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.first_landing: (context) => const LandingContainer(),
    AppRoutes.register_member: (context) => const MemberRegistrationScreen(),
    AppRoutes.login : (context) => const LoginScreen(),
    AppRoutes.userHome : (context) => const UserNavigation(),
    AppRoutes.unverifiedHome : (context) => const UnverifiedNavigation(),
    AppRoutes.member_registration_success : (context) => const MemberRegistrationSuccessScreen(),
    AppRoutes.credit_request_success : (context) => const CreditSuccessScreen()
  };
}