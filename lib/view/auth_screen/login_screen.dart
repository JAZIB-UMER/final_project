import 'package:cv_maker/resources/consts/consts.dart';
import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  FocusNode emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                  fontFamily: bold, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }
}
