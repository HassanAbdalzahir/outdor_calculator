import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:outdor_calculator/first_page.dart';
import 'package:outdor_calculator/modules/sign-in/log-in.dart';
import 'package:provider/provider.dart';
import '../../shared/components/components.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconButton(
                text: 'Sign Up with Google',
                icon: FontAwesomeIcons.google,
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.signInWithGoogle().then(const FirstPage() as FutureOr
                      Function(UserCredential value));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              iconButton(
                text: 'Sign Up with email',
                icon: Icons.email,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
