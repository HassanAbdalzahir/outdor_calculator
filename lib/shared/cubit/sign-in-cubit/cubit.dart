import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outdor_calculator/first_page.dart';
import 'package:outdor_calculator/shared/cubit/sign-in-cubit/states.dart';

class LoginCubit extends Cubit<LoginParentState> {
  LoginCubit() : super(LoginFirstState());

  String? email;
  String? password;
  loginUser(context, {email, password}) async =>
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          if (kDebugMode) {
            print('LoginSuccess');
          }
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const FirstPage(),), (route) => false);
      })
      .catchError(onError);
}