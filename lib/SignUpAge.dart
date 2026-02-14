import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SignUpWeight.dart';

class SignUpAgePage extends StatefulWidget {
  const SignUpAgePage({super.key});

  @override
  State<SignUpAgePage> createState() => _SignUpAgePageState();
}

class _SignUpAgePageState extends State<SignUpAgePage> {
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "HOW OLD ARE YOU?",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 30),

              // Age Input Field
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _ageController,
                  cursorColor: Colors.red,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Age doesn't need decimals
                  ],
                  decoration: const InputDecoration(
                    hintText: "Enter your age",
                    hintStyle: TextStyle(color: Colors.white38),
                    prefixIcon: Icon(Icons.cake, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Navigation Row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton("Prev", Icons.arrow_back, () {
                      Navigator.pop(context);
                    }),
                    const SizedBox(width: 16),
                    _buildActionButton("Next", Icons.arrow_forward, () {
                      String ageValue = _ageController.text;
                      if (ageValue.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpWeightGoalPage()),
                        );

                        // Logic to navigate to Weight or Gender
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter your age")),
                        );
                      }
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 140,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 18),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}