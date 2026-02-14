import 'package:flutter/material.dart';

import 'SignUpAge.dart';

class SignUpGymStatusPage extends StatefulWidget {
  const SignUpGymStatusPage({super.key});

  @override
  State<SignUpGymStatusPage> createState() => _SignUpGymStatusPageState();
}

class _SignUpGymStatusPageState extends State<SignUpGymStatusPage> {
  // Variable to store the gym status selection
  String goesToGym = "";

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
                  "Do You Go To Gym?",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Options Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButtonForOption("YES", Icons.check_circle_outline, () {
                    setState(() {
                      goesToGym = "YES";
                    });
                  }, goesToGym == "YES"),
                  const SizedBox(width: 20),
                  _buildActionButtonForOption("NO", Icons.highlight_off, () {
                    setState(() {
                      goesToGym = "NO";
                    });
                  }, goesToGym == "NO"),
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
                      Navigator.pop(context);
                    }),
                    const SizedBox(width: 16),
                    _buildActionButton("Next", Icons.arrow_forward, () {
                      if (goesToGym.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpAgePage()),
                        );

                        // Add your navigation to the next screen here
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const NextPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select an option")),
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

  // Selection Button Helper
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