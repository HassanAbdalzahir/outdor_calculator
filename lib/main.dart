import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outdor_calculator/firebase_options.dart';
import 'package:outdor_calculator/shared/cubit/sign-in-cubit/cubit.dart';
import 'package:provider/provider.dart';
import 'modules/sign-in/log-in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MultiProvider(
          providers: [
            BlocProvider(create: (_) => LoginCubit())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Murad Agency',
            home: Login(),
          ),
        ),
      );
}
