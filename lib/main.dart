import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/home.dart';
import 'package:todo/login/login.dart';
import 'package:todo/login/signup.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:todo/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return MaterialApp(
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: pro.firebaseUser != null
          ? HomeScreen.routeName
          : LoginScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
