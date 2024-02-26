import 'dart:async';

import 'package:cv_maker/repository/services/user_id.dart';
import 'package:cv_maker/resources/consts/consts.dart';
import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      SessionController().userId = user.uid.toString();
      Timer(const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, RoutesName.home));
    } else {
      Timer(const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, RoutesName.login));
    }
  }

  void logOut(BuildContext context) {
    final auth = FirebaseAuth.instance;
    auth.signOut().then((value) {
      SessionController().userId = '';
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.login, (route) => false);
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), Colors.red, context);
    });
  }
}
