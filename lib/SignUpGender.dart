import 'package:flutter/material.dart';

import 'SignUpUserName.dart';

class SignUpGenderPage extends StatefulWidget {
  const SignUpGenderPage({super.key});

  @override
  State<SignUpGenderPage> createState() => _SignUpGenderPageState();
}

class _SignUpGenderPageState extends State<SignUpGenderPage> {
  // Variable to store which gender is selected
  String selectedGender = "";

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
                  "Select Your Gender?",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Gender Options Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButtonForOption("MALE", Icons.male, () {
                    setState(() {
                      selectedGender = "MALE";
                    });
                  }, selectedGender == "MALE"),
                  const SizedBox(width: 20),
                  _buildActionButtonForOption("FEMALE", Icons.female, () {
                    setState(() {
                      selectedGender = "FEMALE";
                    });
                  }, selectedGender == "FEMALE"),
                ],
              ),

              const SizedBox(height: 40),

              // Navigation Row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton1("Prev", Icons.arrow_back, () {
                      Navigator.pop(context); // Goes back to the previous screen
                    }),
                    const SizedBox(width: 16),
                    _buildActionButton2("Next", Icons.arrow_forward, () {
                      if (selectedGender.isEmpty) {
                        // Optional: Show a message if no gender is picked
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select a gender")),
                        );
                      } else {
                        print("Selected Gender: $selectedGender");
                        // Add your navigation to the next screen here
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

  // Action Button for Gender (Changes border when selected)
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

  // Navigation Button (Prev/Next)
  Widget _buildActionButton1(String label, IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 140,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 18),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
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


  Widget _buildActionButton2(String label, IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 140,
      height: 50,
      child: ElevatedButton.icon(
        onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SignUpNamePage();
          }));
        },
        icon: Icon(icon, color: Colors.white, size: 18),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
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