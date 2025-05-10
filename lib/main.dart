import 'package:flutter/material.dart';
import 'package:projecho/pages/onboard.dart';
import 'package:projecho/pages/login.dart';
import 'package:projecho/pages/Signup/enteruname.dart'; // Correct import
import 'package:projecho/pages/Signup/usertype.dart'; // Ensure this exists
import 'package:projecho/pages/Signup/birthdate.dart'; // Corrected import
import 'package:projecho/pages/Signup/gender.dart';
import 'package:projecho/pages/Signup/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyOnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/username': (context) => const Usernamescreen(), // Correct route
        '/usertype': (context) => const UserTypeScreen(),
        '/birthdate': (context) => const BirthdateScreen(), // Ensure this exists
        '/gender': (context) => const GenderSelectionScreen(), // Add this route
        '/auth': (context) => const RegistrationMethodScreen(), // Ensure this exists
      },
    );
  }
}
