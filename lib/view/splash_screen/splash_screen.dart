import 'dart:async';

import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/view/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(context, RoutesName.home);
    });

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
