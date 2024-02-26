import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/view/auth_screen/signup_screen.dart';
import 'package:cv_maker/view/home_screen.dart';
import 'package:cv_maker/view/auth_screen/login_screen.dart';
import 'package:cv_maker/view/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}
