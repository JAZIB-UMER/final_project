import 'package:cv_maker/repository/services/firebase_services.dart';
import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/components/round_button.dart';
import '../../resources/consts/color.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  FireBaseServices _myRepo = FireBaseServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  @override
  // ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  //FocusNode emailFocusNode = FocusNode();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: height * 0.3,
                  width: width * 0.3,
                  child: Image.asset('assets/icons/cv_maker_logo.png'),
                ),
              ),
              Text(
                'SignUp',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  hintText: 'UserName',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: lightBlue),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: lightBlue),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<AuthViewModel>(builder: (context, object, index) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: object.obscureText,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: InkWell(
                      onTap: () {
                        object.changeObscure();
                      },
                      child: Icon(object.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off_outlined),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: lightBlue),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 20,
              ),
              Consumer<AuthViewModel>(builder: (context, object, index) {
                return RoundButton(
                  title: 'Sign Up',
                  loading: object.loading,
                  onPress: () async {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Email is missing', Colors.red, context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Password is missing', Colors.red, context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          'Password length is short', Colors.red, context);
                    } else {
                      object.setLoading(true);
                      await _myRepo
                          .signUp(
                              context,
                              _emailController.text,
                              _passwordController.text,
                              _userNameController.text)
                          .then((value) {
                        _emailController.clear();
                        _passwordController.clear();
                        _userNameController.clear();
                        object.setLoading(false);
                        Navigator.pushReplacementNamed(
                            context, RoutesName.home);
                      }).onError((error, stackTrace) {
                        object.setLoading(false);
                        Utils.flushBarErrorMessage(
                            error.toString(), Colors.red, context);
                      });
                    }
                  },
                  height: height,
                  width: width,
                );
              }),
            ],
          ),
        ),
      )),
    );
  }
}
