import 'dart:async';
import 'package:flutter/material.dart';
import 'SignUp.dart';

class IntroSplash extends StatefulWidget {
  const IntroSplash({super.key});

  @override
  State<IntroSplash> createState() => _IntroSplashState();
}

class _IntroSplashState extends State<IntroSplash> {

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  /////////////////////////////////////////////////////////////
  /// NAVIGATION
  /////////////////////////////////////////////////////////////

  Future<void> _navigate() async {

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return; // VERY IMPORTANT SAFETY CHECK

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const SignUpPage(),
      ),
    );
  }

  /////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Center(
          child: Text(
            'Welcome to the Gym Land',
            style: TextStyle(
              color: Colors.red,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
