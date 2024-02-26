import 'dart:ffi';
import 'dart:io';
import 'package:cv_maker/repository/services/user_id.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_maker/data/app_exceptions.dart';
import 'package:cv_maker/resources/consts/consts.dart';
import 'package:cv_maker/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //RealTime DataBase
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  Future<dynamic> login(
      BuildContext context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
      });
    } on SocketException {
      throw FetchDataExceptions('No Internet');
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic> signUp(BuildContext context, String email, String password,
      String username) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email, password: password.toString())
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'password': password,
          'username': username,
        });
      });
    } on SocketException {
      throw FetchDataExceptions('No Internet');
    } catch (e) {
      throw e.toString();
    }
  }
}
