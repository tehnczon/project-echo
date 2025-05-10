import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegistrationMethodScreen extends StatefulWidget {
  const RegistrationMethodScreen({super.key});

  @override
  State<RegistrationMethodScreen> createState() => _RegistrationMethodScreenState();
}

class _RegistrationMethodScreenState extends State<RegistrationMethodScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    try {
      // Initiate Google Sign-In
      final GoogleSignInAccount? user = await _googleSignIn.signIn();

      if (user != null) {
        // Google Sign-In successful, get user info
        print("Signed in as: ${user.displayName}");
        
        // You can get additional info like email and profile picture
        final email = user.email;
        final displayName = user.displayName;
        final photoUrl = user.photoUrl;

        // You can use this data as needed, e.g., save to a database, navigate, etc.
        // For example, navigate to the next screen:
        Navigator.pushNamed(context, '/password');
      }
    } catch (error) {
      print('Google sign-in failed: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google Sign-In failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Input your mobile number",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(
                hintText: "Mobile Number",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 8),
            const Text(
              "You may receive SMS notifications from us.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  final mobileNumber = _mobileController.text.trim();
                  if (mobileNumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a mobile number')),
                    );
                  } else {
                    debugPrint("Entered mobile number: $mobileNumber");
                    // Proceed to the next screen (e.g., OTP verification)
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: Image.asset('assets/icons/google.png', height: 24),
              label: const Text('Sign in with Google'),
              onPressed: _signInWithGoogle,  // Trigger the Google sign-in
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.grey),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
