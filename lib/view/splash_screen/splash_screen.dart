import 'dart:async';

import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/view/auth_screen/login_screen.dart';
import 'package:cv_maker/view/splash_screen/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();
  @override
  initState() {
    _splashServices.isLogin(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animations/Animation - 1708595413061.json'),
      ),
    );
  }
}
