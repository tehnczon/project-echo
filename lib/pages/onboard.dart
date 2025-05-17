import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOnboardingScreen extends StatelessWidget {
  const MyOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1F9), // Set background color here
      body: Onboarding(
        swipeableBody: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      'assets/onboarding/onboard.jpg',
                      width: 280,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Let\'s get started',
                      style: GoogleFonts.poppins(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to Echo - a space to learn, connect, and be heard. Your voice matters.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        buildFooter: (context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection) {
          return Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed:  () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        animationInMilliseconds: 300,
      ),
    );
  }
}
