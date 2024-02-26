import 'package:cv_maker/repository/auth_repository.dart';
import 'package:cv_maker/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  // Loading
  bool _loading = false;
  bool get loading => _loading;

  // obscure Text
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  changeObscure() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // Auth Repository Object
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Login Successfully', Colors.green, context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), Colors.red, context);
    });
  }
}
