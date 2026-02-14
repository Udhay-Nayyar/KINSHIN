import 'package:flutter/material.dart';

import 'SignUpExperience.dart';

class SignUpGoalPage extends StatefulWidget {
  const SignUpGoalPage({super.key});

  @override
  State<SignUpGoalPage> createState() => _SignUpGoalPageState();
}

class _SignUpGoalPageState extends State<SignUpGoalPage> {
  // Variable to store which goal is selected
  String selectedGoal = "";

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
                  "Monthly / Weekly Goal?",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Goal Options Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButtonForOption("Weekly", Icons.trending_up, () {
                    setState(() {
                      selectedGoal = "Weekly";
                    });
                  }, selectedGoal == "Weekly"),
                  const SizedBox(width: 20),
                  _buildActionButtonForOption("Monthly", Icons.calendar_month, () {
                    setState(() {
                      selectedGoal = "Monthly";
                    });
                  }, selectedGoal == "Monthly"),
                ],
              ),

              const SizedBox(height: 40),

              // Navigation Row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton("Prev", Icons.arrow_back, () {
                      Navigator.pop(context); // Go back to Height screen
                    }),
                    const SizedBox(width: 16),
                    _buildActionButton("Finish", Icons.check, () {
                      if (selectedGoal.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpExperiencePage()),
                        );
                        // Logic to complete registration or go to Dashboard
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select a goal")),
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

  // Action Button for Goal (Changes color when selected)
  Widget _buildActionButtonForOption(String label, IconData icon, VoidCallback onPressed, bool isSelected) {
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
          backgroundColor: isSelected ? Colors.red : Colors.grey[900],
          side: BorderSide(color: isSelected ? Colors.white : Colors.red, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  // Navigation Button (Prev/Finish)
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