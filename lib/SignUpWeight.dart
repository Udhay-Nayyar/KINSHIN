import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'WelcomeSplash.dart';

class SignUpWeightGoalPage extends StatefulWidget {
  const SignUpWeightGoalPage({super.key});

  @override
  State<SignUpWeightGoalPage> createState() => _SignUpWeightGoalPageState();
}

class _SignUpWeightGoalPageState extends State<SignUpWeightGoalPage> {
  // Separate controllers for current and target weight
  final TextEditingController _currentWeightController = TextEditingController();
  final TextEditingController _targetWeightController = TextEditingController();

  @override
  void dispose() {
    _currentWeightController.dispose();
    _targetWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "SET YOUR TARGET",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Tell us where you are and where you want to be.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 40),

                // Current Weight Field
                _buildWeightField(
                  label: "CURRENT WEIGHT",
                  controller: _currentWeightController,
                  icon: Icons.scale,
                ),

                const SizedBox(height: 25),

                // Target Weight Field
                _buildWeightField(
                  label: "TARGET WEIGHT",
                  controller: _targetWeightController,
                  icon: Icons.flag,
                ),

                const SizedBox(height: 50),

                // Navigation Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton("Prev", Icons.arrow_back, () {
                      Navigator.pop(context);
                    }),
                    const SizedBox(width: 16),
                    _buildActionButton("Next", Icons.arrow_forward, () {
                      String current = _currentWeightController.text;
                      String target = _targetWeightController.text;

                      if (current.isNotEmpty && target.isNotEmpty) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcomesplash()));
                        print("Current: $current kg, Target: $target kg");
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const NextPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please fill in both fields")),
                        );
                      }
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom helper for weight input fields
  Widget _buildWeightField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          cursorColor: Colors.red,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
          ],
          decoration: InputDecoration(
            hintText: "00.0",
            hintStyle: const TextStyle(color: Colors.white24),
            prefixIcon: Icon(icon, color: Colors.white),
            suffixText: "kg",
            suffixStyle: const TextStyle(color: Colors.red),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  // Reuse your navigation button style
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