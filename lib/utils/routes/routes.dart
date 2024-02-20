import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/view/home_screen.dart';
import 'package:cv_maker/view/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

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
