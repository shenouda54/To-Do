import 'package:flutter/material.dart';
import 'package:todo/home.dart';
import 'package:todo/splash.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName : (context) =>HomeScreen(),
      },
      initialRoute:SplashScreen.routeName,
      debugShowCheckedModeBanner: false,

    );
  }
}
