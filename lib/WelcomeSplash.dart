import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeSplash extends StatefulWidget {
  const WelcomeSplash({super.key});

  @override
  State<WelcomeSplash> createState() =>
      _WelcomeSplashState();
}

class _WelcomeSplashState
    extends State<WelcomeSplash> {

  /////////////////////////////////////////////////////////////
  /// INIT
  /////////////////////////////////////////////////////////////

  @override
  void initState() {
    super.initState();
    _startApp();
  }

  /////////////////////////////////////////////////////////////
  /// CHECK LOGIN STATE
  /////////////////////////////////////////////////////////////

  Future<void> _startApp() async {

    // Small splash delay
    await Future.delayed(
        const Duration(seconds: 3));

    final prefs =
    await SharedPreferences.getInstance();

    final isLoggedIn =
        prefs.getBool("isLoggedIn") ?? false;

    if (!mounted) return;

    ///////////////////////////////////////////////////////////
    /// NAVIGATION
    ///////////////////////////////////////////////////////////

    if (isLoggedIn) {

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/main',
            (route) => false,
      );

    } else {

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
            (route) => false,
      );
    }
  }

  /////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      backgroundColor: Colors.black,

      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [

            Icon(
              Icons.fitness_center,
              color: Colors.red,
              size: 90,
            ),

            SizedBox(height: 25),

            Text(
              "LEAVE YOUR WEAKNESS AT THE DOOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontStyle: FontStyle.italic,
              ),
            ),

            SizedBox(height: 12),

            Text(
              "ESTABLISHING WARRIOR PROTOCOL...",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}