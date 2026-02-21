import 'package:flutter/material.dart';

enum GenderType { male, female }

class SignUpGenderPage extends StatefulWidget {
  const SignUpGenderPage({super.key});

  @override
  State<SignUpGenderPage> createState() =>
      _SignUpGenderPageState();
}

class _SignUpGenderPageState
    extends State<SignUpGenderPage> {

  GenderType? selectedGender;

  /////////////////////////////////////////////////////////////
  /// NEXT
  /////////////////////////////////////////////////////////////

  void _goNext() {

    if (selectedGender == null) {
      _showSnack("Please select a gender");
      return;
    }

    final args =
    ModalRoute.of(context)!.settings.arguments as Map?;

    if (args == null) {
      _showSnack("Signup data missing");
      return;
    }

    final genderValue =
    selectedGender == GenderType.male
        ? "male"
        : "female";

    /////////////////////////////////////////////////////////////
    /// FORWARD ALL DATA CLEANLY
    /////////////////////////////////////////////////////////////

    Navigator.pushNamed(
      context,
      '/signup-name',
      arguments: {
        ...args,
        "gender": genderValue,
      },
    );
  }

  /////////////////////////////////////////////////////////////

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  /////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 30),

          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [

              const Text(
                "SELECT YOUR GENDER",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              Row(
                children: [

                  Expanded(
                    child: _genderButton(
                      label: "MALE",
                      icon: Icons.male,
                      isSelected:
                      selectedGender ==
                          GenderType.male,
                      onTap: () {
                        setState(() {
                          selectedGender =
                              GenderType.male;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: _genderButton(
                      label: "FEMALE",
                      icon: Icons.female,
                      isSelected:
                      selectedGender ==
                          GenderType.female,
                      onTap: () {
                        setState(() {
                          selectedGender =
                              GenderType.female;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _goNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text("NEXT"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderButton({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor:
        isSelected ? Colors.red : Colors.grey[900],
      ),
    );
  }
}