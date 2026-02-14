import 'package:flutter/material.dart';
import 'package:my_first_app/IntroSplash.dart';

void main() {
  // 1. Always run your main "MyApp" class first
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 2. This is where you tell the app to start with the splash screen
      home: Introsplash(),
    );
  }
}