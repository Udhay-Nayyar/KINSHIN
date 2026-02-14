
// ------------------------------------------------------------------------------------------------------------------------------------------
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The Kanji title
            const Text(
              "剣心",
              style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(
                "HEART OF THE SWORD",
                style: TextStyle(
                  color: Colors.red,
                  letterSpacing: 2, // Added spacing for a cinematic feel
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
              width: 300,
              child: TextField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email / Phone Number",
                  hintStyle: const TextStyle(color: Colors.white70),
                  prefixIcon: const Icon(Icons.email, color: Colors.white), // Fixed icon color
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2), // Red border on focus
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20), // Spacing between field and button

            SizedBox(
              width: 250, // Slightly wider for the text
              height: 50,  // Defined height for a better touch target
              child: ElevatedButton(
                onPressed: () {
                  print("OTP requested");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: const Text(
                  "GET OTP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );


  }
}