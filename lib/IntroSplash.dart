import 'dart:async';
import 'package:flutter/material.dart';
import 'SignUp.dart';

class Introsplash extends StatefulWidget {
  @override
  _IntrosplashState createState() => _IntrosplashState();
}

class _IntrosplashState extends State<Introsplash> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const SignUpPage();
        }),
      );
    });
  } // <--- The initState method must end here

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black, // Matching your Gym theme
      body: Center(
        child: Text(
          'Welcome to the Gym Land',
          style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}