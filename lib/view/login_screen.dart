import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  FocusNode emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.home);
        },
        child: const Text('Click'),
      ),
    );
  }
}
