import 'package:cv_maker/repository/services/firebase_services.dart';
import 'package:cv_maker/repository/services/shared_pref_services.dart';
import 'package:cv_maker/resources/components/round_button.dart';
import 'package:cv_maker/resources/consts/consts.dart';
import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/utils/utils.dart';
import 'package:cv_maker/view_model/auth_view_model.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //FirebaseAuth _auth = FirebaseAuth.instance;
  final FireBaseServices _firebaseservices = FireBaseServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  // ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  //FocusNode emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

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
              Hero(
                tag: 'icon',
                child: Center(
                  child: SizedBox(
                    height: height * 0.3,
                    width: width * 0.3,
                    child: Image.asset('assets/icons/cv_maker_logo.png'),
                  ),
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: lightBlue),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<AuthViewModel>(builder: (context, object, index) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: object.obscureText,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
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
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signUpScreen);
                },
                child: const Text('Don\'t Have an account'),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<AuthViewModel>(builder: (context, object, index) {
                return RoundButton(
                  title: 'Login',
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
                      await _firebaseservices
                          .login(context, _emailController.text,
                              _passwordController.text)
                          .then((value) async {
                        object.setLoading(false);
                        _emailController.clear();
                        _passwordController.clear();

                        //-----
                        //fetching userdata
                        await SharedPreferencesHelper().fetchData();
                        Navigator.pushReplacementNamed(
                            context, RoutesName.homeScreen);
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
