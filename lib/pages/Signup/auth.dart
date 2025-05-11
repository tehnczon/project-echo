import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationMethodScreen extends StatefulWidget {
  const RegistrationMethodScreen({super.key});

  @override
  State<RegistrationMethodScreen> createState() => _RegistrationMethodScreenState();
}

class _RegistrationMethodScreenState extends State<RegistrationMethodScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isProcessing = false;

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
  setState(() {
    _isProcessing = true; // Set loading state
  });

  try {
    final GoogleSignInAccount? user = await _googleSignIn.signIn();

    if (user != null) {
      final email = user.email;
      final displayName = user.displayName;
      final photoUrl = user.photoUrl;

      print("Signed in as: $displayName");

      // Navigate to the next screen after successful Google sign-in
      Navigator.pushNamed(context, '/password', arguments: {
        'email': email,
        'displayName': displayName,
        'photoUrl': photoUrl,
      });
    }
  } catch (error) {
    print('Google sign-in failed: $error');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Google Sign-In failed')),
    );
  } finally {
    setState(() {
      _isProcessing = false; // Reset loading state
    });
  }
}


  void _sendOTP(String mobileNumber) async {
    setState(() {
      _isProcessing = true; // Set loading state
    });

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+63$mobileNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushNamed(context, '/password'); // Optional: skip OTP
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification failed: ${e.message}')),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.pushNamed(
          context,
          '/otp',
          arguments: {
            'verificationId': verificationId,
            'phoneNumber': mobileNumber,
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    setState(() {
      _isProcessing = false; // Reset loading state
    });
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
                onPressed: _isProcessing
                    ? null
                    : () {
                        final mobileNumber = _mobileController.text.trim();
                        if (mobileNumber.isEmpty || mobileNumber.length < 10) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please enter a valid mobile number')),
                          );
                        } else {
                          _sendOTP(mobileNumber);
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: _isProcessing
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
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
  icon: Image.asset('assets/icons/google.png', height: 24), // Google icon
  label: _isProcessing
      ? const Text('Signing in...')
      : const Text('Sign in with Google'),  // Button text should be for Google authentication
  onPressed: _isProcessing ? null : _signInWithGoogle,  // Calls Google Sign-In logic
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
