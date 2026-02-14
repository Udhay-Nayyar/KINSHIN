import 'dart:async'; // Required for Timer
import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'UserMainPage.dart'; // Make sure this matches your filename

class Welcomesplash extends StatefulWidget {
  const Welcomesplash({super.key});

  @override
  State<Welcomesplash> createState() => _WelcomesplashState();
}

class _WelcomesplashState extends State<Welcomesplash> {
  @override
  void initState() {
    super.initState();

    // Timer to move to the next screen after 5 seconds
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Usermainpage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fitness_center, color: Colors.red, size: 80),
            const SizedBox(height: 20),
            const Text(
              "LEAVE YOUR WEAKNESS AT THE DOOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "ESTABLISHING WARRIOR PROTOCOL...",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}