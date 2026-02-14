import 'package:flutter/material.dart';

import 'SignUpGymAvilable.dart';

class SignUpExperiencePage extends StatefulWidget {
  const SignUpExperiencePage({super.key});

  @override
  State<SignUpExperiencePage> createState() => _SignUpExperiencePageState();
}

class _SignUpExperiencePageState extends State<SignUpExperiencePage> {
  // Controller to capture the input text
  final TextEditingController _experienceController = TextEditingController();

  @override
  void dispose() {
    _experienceController.dispose(); // Always dispose controllers to save memory
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
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "How Much Experience?",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _experienceController,
                    cursorColor: Colors.red,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Experience",
                      hintStyle: TextStyle(color: Colors.white38),
                      prefixIcon: Icon(Icons.timelapse, color: Colors.white),
                      suffixText: "years",
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
                      String experience = _experienceController.text;
                      if (experience.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpGymStatusPage()),
                        );
                        // Add navigation to next screen here
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter your experience")),
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

  // Navigation Button Helper
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