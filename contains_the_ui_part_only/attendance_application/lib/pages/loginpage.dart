import 'package:attendance_application/pages/homepage.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF0F0D20), // Background color similar to the image
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Section
              const Text(
                'EspaceX',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 10),
              // Sign in label
              const Text(
                'SIGN IN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),
              // Email TextFormField
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Sign In with email address',
                  labelStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: Colors.black45,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black38),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF2366F0), // Blue button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  onPressed: () {
                    // need to be changed by akash
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
                    );
                  },
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Or continue with
              const Text(
                'Or continue with open account',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              // Social media login buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google Button
                  IconButton(
                    onPressed: () {
                      // Google sign-in logic
                    },
                    icon: const Icon(Icons.g_mobiledata),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  const SizedBox(width: 40),
                  // Facebook Button
                  IconButton(
                    onPressed: () {
                      // Facebook sign-in logic
                    },
                    icon: const Icon(Icons.facebook),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Terms and conditions
              const Text(
                'By registering you agree with our Terms & Conditions',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              // Copyright
              const Text(
                'COPYRIGHT (C) 2022 ONFLOW DESIGN.',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
