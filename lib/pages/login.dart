import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/logo/logo.PNG', height: 150
              ),

              const SizedBox(height: 10),

              // Email
                const SizedBox(
                width: double.infinity,
                child: SizedBox(
                  height: 40,
                  child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(),
                  ),
                  ),
                ),
                ),
              

              const SizedBox(height: 16),

              // Password
              const SizedBox(
                width: double.infinity,
                child: SizedBox(
                  height: 40,
                    child: TextField(
                    obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(),
                  ),
                  ),
                ),
                ),

              const SizedBox(height: 16),

              // Log in button
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8,),
                  ),
                  onPressed: () {},
                  child: const Text('Log in',
                  style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold,
                    color: Colors.white, // Set the text color to white
                  ),
                ),
              ),
              ),

              //forgot password
                TextButton(
                onPressed: () {},
                child: const Text('Forgot password?'),
              ),


              const SizedBox(height: 0),
                

              // Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 12),
                    ),
                    TextButton(
                    onPressed: () {
                      // Navigate to the sign-up page
                      Navigator.pushNamed(context, '/username');
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                 Expanded(child: Divider(thickness: 1)),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Expanded(child: Divider(thickness: 1)),
                ],
              ),

               const SizedBox(height: 10),


              // Facebook login
              ElevatedButton.icon(
                icon: const Icon(Icons.facebook, color: Colors.blue,
                    size: 30),
                label: const Text('Sign in with Facebook'),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),

              const SizedBox(height: 10),

              // Google login
              ElevatedButton.icon(
                  icon: Image.asset('assets/icons/google.png', height: 24),
                   label: const Text('Sign in with Google'),
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                 ),
),

              const SizedBox(height: 20),

              // Terms and Privacy
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    TextButton(
                    onPressed: () {}, 
                    child: const Text(
                      "Terms of Use",
                      style: TextStyle(color: Color.fromARGB(255, 125, 196, 255)),
                    ),
                    ),
                  const Text("|"),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text(
                      "Privacy Policy",
                      style: TextStyle(color: Color.fromARGB(255, 125, 196, 255)),
                    ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
