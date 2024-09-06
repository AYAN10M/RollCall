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
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/img/login_screen_wallpaper.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.darken),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Section
                const Text(
                  'RollCall',
                  style: TextStyle(
                    color: Color.fromARGB(255, 237, 246, 249),
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GreatVibes',
                  ),
                ),

                const SizedBox(height: 10),
                // Sign in label
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login, color: Colors.white, size: 30),
                    SizedBox(width: 10),
                    Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Tomorrow',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Email TextFormField
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Sign In with email address',
                    labelStyle: const TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Tomorrow',
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
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Tomorrow',
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
                      backgroundColor: const Color.fromARGB(
                          255, 0, 109, 119), // Blue button color
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
                        fontFamily: 'Tomorrow',
                        fontSize: 16,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                // Copyright
                const Text(
                  'COPYRIGHT (C) 2024 TEAM DEVDYNAMO',
                  style: TextStyle(
                    color: Colors.white60,
                    fontFamily: 'Tomorrow',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
