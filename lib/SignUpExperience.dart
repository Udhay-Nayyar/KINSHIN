import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpExperiencePage extends StatefulWidget {
  const SignUpExperiencePage({super.key});

  @override
  State<SignUpExperiencePage> createState() =>
      _SignUpExperiencePageState();
}

class _SignUpExperiencePageState
    extends State<SignUpExperiencePage> {

  final TextEditingController _experienceController =
  TextEditingController();

  @override
  void dispose() {
    _experienceController.dispose();
    super.dispose();
  }

  /////////////////////////////////////////////////////////////
  /// NEXT STEP
  /////////////////////////////////////////////////////////////

  void _goNext() {

    final text = _experienceController.text.trim();

    if (text.isEmpty) {
      _showSnack("Please enter your experience");
      return;
    }

    final years = int.tryParse(text);

    if (years == null || years < 0 || years > 50) {
      _showSnack("Enter valid experience (0 - 50 years)");
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
      '/signup-gym',
      arguments: {
        ...args,
        "experience": years,
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
                  "HOW MUCH EXPERIENCE?",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: _experienceController,
                  cursorColor: Colors.red,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  keyboardType:
                  TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter
                        .digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                  decoration: InputDecoration(
                    hintText: "Experience",
                    hintStyle:
                    const TextStyle(
                        color: Colors.white38),
                    prefixIcon: const Icon(
                      Icons.timelapse,
                      color: Colors.white,
                    ),
                    suffixText: "years",
                    suffixStyle:
                    const TextStyle(
                        color: Colors.red),
                    enabledBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(
                          color:
                          Colors.white24),
                    ),
                    focusedBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(
                          color: Colors.red,
                          width: 2),
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
                          const Size(
                              double.infinity,
                              55),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _goNext,
                        icon: const Icon(
                            Icons.arrow_forward),
                        label:
                        const Text("Next"),
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.red,
                          minimumSize:
                          const Size(
                              double.infinity,
                              55),
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