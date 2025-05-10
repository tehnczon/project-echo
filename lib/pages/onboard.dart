import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOnboardingScreen extends StatelessWidget {
  const MyOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        swipeableBody: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Padding(padding: EdgeInsets.only(top: 50)),
                 Image.asset(
                  'assets/onboarding/onboarding_image.PNG',  // Correct path relative to the root of the assets folder
                  width: 250,                                 // Adjust the size as needed
                  height: 250,
                 fit: BoxFit.cover,                          // Optional: Adjust how the image fits
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Let\'s get started',
                    style: GoogleFonts.poppins(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Optional: Add color if needed
                    ),
                    
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Welcome to Echo - a space to learn, connect, and be heard. Your voice matters.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        buildFooter: (context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Center(
                child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent, // Set the button color to sky blue
                  shape: RoundedRectangleBorder(    
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                    ),
                    minimumSize: Size(200, 50), // Increase button size
                ),
                child: const Text('Get Started',
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.white, // Set the text color to white
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
