import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpHeightPage extends StatefulWidget {
  const SignUpHeightPage({super.key});

  @override
  State<SignUpHeightPage> createState() =>
      _SignUpHeightPageState();
}

class _SignUpHeightPageState
    extends State<SignUpHeightPage> {

  final TextEditingController _heightController =
  TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    super.dispose();
  }

  /////////////////////////////////////////////////////////////
  /// NEXT STEP
  /////////////////////////////////////////////////////////////

  void _goNext() {

    final text = _heightController.text.trim();

    if (text.isEmpty) {
      _showSnack("Please enter your height");
      return;
    }

    final height = int.tryParse(text);

    if (height == null ||
        height < 120 ||
        height > 230) {

      _showSnack(
          "Enter valid height (120 - 230 cm)");
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
      '/signup-goal',
      arguments: {
        ...args,
        "height": height,
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

                const Text(
                  "ENTER YOUR HEIGHT",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: _heightController,
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
                    LengthLimitingTextInputFormatter(3),
                  ],
                  decoration: InputDecoration(
                    hintText: "Height in cm",
                    hintStyle:
                    const TextStyle(
                        color: Colors.white38),
                    prefixIcon: const Icon(
                      Icons.height,
                      color: Colors.white,
                    ),
                    suffixText: "cm",
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
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                10),
                          ),
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
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                10),
                          ),
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