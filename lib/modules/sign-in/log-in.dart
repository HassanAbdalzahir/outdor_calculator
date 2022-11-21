import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outdor_calculator/shared/components/cubit/cubit.dart';
import 'package:outdor_calculator/shared/components/cubit/states.dart';
import 'package:outdor_calculator/shared/cubit/sign-in-cubit/cubit.dart';
import 'package:outdor_calculator/shared/cubit/sign-in-cubit/states.dart';
import '../../first_page.dart';
import '../../shared/components/components.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'sign_up.dart';

class Login extends StatelessWidget {
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginParentState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        LoginCubit prov = BlocProvider.of<LoginCubit>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 100,
                        child: Image.asset('assets/images/murad.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        type: TextInputType.emailAddress,
                        label: 'Email or Phone Number',
                        prefix: Icons.person,
                        onChange: (String value) {
                          prov.email = value;
                        },
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name or email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        type: TextInputType.visiblePassword,
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: isPassword
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        isPassword: isPassword,
                        suffixPressed: () {
                          isPassword = !isPassword;
                        },
                        onChange: (String value) {
                          prov.password = value;
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Password is too short';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      button(
                        width: double.infinity,
                        text: 'LOGIN',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            prov.loginUser(context,
                                email: prov.email, password: prov.password);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            ),
                            child: const Text(
                              'Register Now',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(context) async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FirstPage(),
                ),
              ));
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}

// class FirstPage extends StatelessWidget {
//   const FirstPage({super.key});

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasData) {
//               return const HomePage();
//             } else if (snapshot.hasError) {
//               return const Center(
//                 child: Text('Something Went Wrong!'),
//               );
//             } else {
//               return const SignUp();
//             }
//           },
//         ),
//       );
// }

