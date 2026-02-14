import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SignUpCommitmentLevel.dart'; // Required for input formatters

class SignUpHeightPage extends StatefulWidget {
  const SignUpHeightPage({super.key});

  @override
  State<SignUpHeightPage> createState() => _SignUpHeightPageState();
}

class _SignUpHeightPageState extends State<SignUpHeightPage> {
  // Controller to capture the text input
  final TextEditingController _heightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose(); // Clean up the controller
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
                "ENTER YOUR HEIGHT",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 30),

              // Height Input Field
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _heightController,
                  cursorColor: Colors.red,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    hintText: "Height in cm",
                    hintStyle: TextStyle(color: Colors.white38),
                    prefixIcon: Icon(Icons.height, color: Colors.white),
                    suffixText: "cm",
                    suffixStyle: TextStyle(color: Colors.red),
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
                      String heightValue = _heightController.text;
                      if (heightValue.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpGoalPage()),
                        );
                        // Add navigation to next screen here
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter your height")),
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