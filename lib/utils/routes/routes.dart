import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/view/auth_screen/signup_screen.dart';
import 'package:cv_maker/view/data_fetch_screen/data_screen.dart';
import 'package:cv_maker/view/data_fetch_screen/education_screen.dart';
import 'package:cv_maker/view/data_fetch_screen/experience_screen.dart';
import 'package:cv_maker/view/data_fetch_screen/expertise_screen.dart';
import 'package:cv_maker/view/data_fetch_screen/language_screen.dart';
import 'package:cv_maker/view/data_fetch_screen/new.dart';
import 'package:cv_maker/view/home_screen.dart';
import 'package:cv_maker/view/auth_screen/login_screen.dart';
import 'package:cv_maker/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RoutesName.dataScreen:
        return MaterialPageRoute(builder: (_) => const DataFetchingScreen());
      case RoutesName.educationScreen:
        return MaterialPageRoute(builder: (_) => const EducationScreen());
      case RoutesName.expertiseScreen:
        return MaterialPageRoute(builder: (_) => const ExpertiseScreen());
      case RoutesName.experienceScreen:
        return MaterialPageRoute(builder: (_) => const ExperienceScreen());
      case RoutesName.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      //---
      case RoutesName.cv:
        return MaterialPageRoute(builder: (_) => CVInputScreen());

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
