import 'package:flutter/material.dart';

class SignUpNamePage extends StatefulWidget {
  const SignUpNamePage({super.key});

  @override
  State<SignUpNamePage> createState() =>
      _SignUpNamePageState();
}

class _SignUpNamePageState
    extends State<SignUpNamePage> {

  final TextEditingController _nameController =
  TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  /////////////////////////////////////////////////////////////
  /// NEXT STEP
  /////////////////////////////////////////////////////////////

  void _goNext() {

    final enteredName =
    _nameController.text.trim();

    if (enteredName.isEmpty) {
      _showSnack("Please enter your name");
      return;
    }

    if (enteredName.length < 2) {
      _showSnack(
          "Name must be at least 2 characters");
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
    /// PASS ALL DATA FORWARD CLEANLY
    /////////////////////////////////////////////////////////////

    Navigator.pushNamed(
      context,
      '/signup-height',
      arguments: {
        ...args,
        "name": enteredName,
      },
    );
  }

  /////////////////////////////////////////////////////////////

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
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

                ///////////////////////////////////////////////////
                /// TITLE
                ///////////////////////////////////////////////////

                const Text(
                  "WHAT'S YOUR NAME, WARRIOR?",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),

                const SizedBox(height: 40),

                ///////////////////////////////////////////////////
                /// FIELD
                ///////////////////////////////////////////////////

                TextField(
                  controller: _nameController,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  keyboardType: TextInputType.name,
                  textCapitalization:
                  TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    hintStyle: const TextStyle(
                        color: Colors.white70),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.white24),
                    ),
                    focusedBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                ///////////////////////////////////////////////////
                /// NAV BUTTONS
                ///////////////////////////////////////////////////

                Row(
                  children: [

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.grey[900],
                          minimumSize:
                          const Size(
                              double.infinity,
                              55),
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(10),
                          ),
                        ),
                        child: const Text("Prev"),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: _goNext,
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.red,
                          minimumSize:
                          const Size(
                              double.infinity,
                              55),
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(10),
                          ),
                        ),
                        child: const Text("Next"),
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