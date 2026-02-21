import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpAgePage extends StatefulWidget {
  const SignUpAgePage({super.key});

  @override
  State<SignUpAgePage> createState() => _SignUpAgePageState();
}

class _SignUpAgePageState extends State<SignUpAgePage> {

  final TextEditingController _ageController =
  TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

  /////////////////////////////////////////////////////////////
  /// NEXT STEP
  /////////////////////////////////////////////////////////////

  void _goNext() {

    final ageText = _ageController.text.trim();

    if (ageText.isEmpty) {
      _showSnack("Please enter your age");
      return;
    }

    final age = int.tryParse(ageText);

    if (age == null || age < 12 || age > 80) {
      _showSnack("Enter a valid age (12 - 80)");
      return;
    }

    /////////////////////////////////////////////////////////////
    /// RECEIVE PREVIOUS SIGNUP DATA
    /////////////////////////////////////////////////////////////

    final args =
    ModalRoute.of(context)!.settings.arguments as Map?;

    if (args == null) {
      _showSnack("Signup data missing");
      return;
    }

    /////////////////////////////////////////////////////////////
    /// PASS EVERYTHING FORWARD CLEANLY
    /////////////////////////////////////////////////////////////

    Navigator.pushNamed(
      context,
      '/signup-weight',
      arguments: {
        ...args,
        "age": age,
      },
    );
  }

  /////////////////////////////////////////////////////////////

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  /////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
          const EdgeInsets.symmetric(horizontal: 30),

          child: SizedBox(
            height:
            MediaQuery.of(context).size.height * .9,

            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [

                const Text(
                  "HOW OLD ARE YOU?",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: _ageController,
                  cursorColor: Colors.red,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  keyboardType:
                  TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                  decoration: InputDecoration(
                    hintText: "Enter your age",
                    hintStyle:
                    const TextStyle(color: Colors.white38),
                    prefixIcon:
                    const Icon(Icons.cake, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(
                          color: Colors.red, width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                Row(
                  children: [

                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:
                        const Icon(Icons.arrow_back),
                        label:
                        const Text("Prev"),
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.grey[900],
                          minimumSize:
                          const Size(double.infinity, 55),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _goNext,
                        icon:
                        const Icon(Icons.arrow_forward),
                        label:
                        const Text("Next"),
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.red,
                          minimumSize:
                          const Size(double.infinity, 55),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}