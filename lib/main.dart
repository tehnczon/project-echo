import 'package:flutter/material.dart';
import 'package:projecho/pages/onboard.dart';
// import 'package:projecho/pages/home.dart';
import 'package:projecho/pages/login.dart';
import 'package:projecho/pages/Signup/enteruname.dart'; // Ensure this file contains the Usernamescreen widget

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyOnboardingScreen(),
    routes: {
      '/login': (_) => LoginScreen(), // Your main screen here
      '/username': (context) => Usernamescreen(), // Your username screen here
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold()
    );
  }
}



