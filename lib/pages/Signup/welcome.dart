import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        swipeableBody: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Image.asset(
                  'assets/onboarding/onboarding_image.PNG',  // Correct path relative to the root of the assets folder
                  width: 250,                                 // Adjust the size as needed
                  height: 250,
                 fit: BoxFit.cover,                          // Optional: Adjust how the image fits
                  ),
                  
                  Text(
                    'Welcome to ',
                    style: GoogleFonts.poppins(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Optional: Add color if needed
                    ),
                    
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only( left: 0),
                    child: Text(
                      'Project Echo        ',

                      style: GoogleFonts.poppins(fontSize: 25,
                        fontWeight: FontWeight.bold,
                     ),
                      textAlign: TextAlign.left,
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 30),
                    child: Text(
                      'a space to learn, connect, and be heard. Your voice matters.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
       
        animationInMilliseconds: 300,
      ),
    );  
  }
}
