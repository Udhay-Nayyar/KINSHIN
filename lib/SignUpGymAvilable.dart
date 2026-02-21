import 'package:flutter/material.dart';

enum GymStatus {
  yes,
  no,
}

class SignUpGymStatusPage extends StatefulWidget {
  const SignUpGymStatusPage({super.key});

  @override
  State<SignUpGymStatusPage> createState() =>
      _SignUpGymStatusPageState();
}

class _SignUpGymStatusPageState
    extends State<SignUpGymStatusPage> {

  GymStatus? selectedStatus;

  /////////////////////////////////////////////////////////////
  /// NEXT STEP
  /////////////////////////////////////////////////////////////

  void _goNext() {

    if (selectedStatus == null) {
      _showSnack("Please select an option");
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

    final gymValue =
    selectedStatus == GymStatus.yes
        ? "yes"
        : "no";

    /////////////////////////////////////////////////////////////
    /// PASS EVERYTHING FORWARD CLEANLY
    /////////////////////////////////////////////////////////////

    Navigator.pushNamed(
      context,
      '/signup-age',
      arguments: {
        ...args,
        "gymAccess": gymValue,
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
                  "DO YOU GO TO THE GYM?",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),

                const SizedBox(height: 40),

                Row(
                  children: [

                    Expanded(
                      child: _statusButton(
                        label: "YES",
                        icon:
                        Icons.check_circle_outline,
                        isSelected:
                        selectedStatus ==
                            GymStatus.yes,
                        onTap: () {
                          setState(() {
                            selectedStatus =
                                GymStatus.yes;
                          });
                        },
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: _statusButton(
                        label: "NO",
                        icon:
                        Icons.highlight_off,
                        isSelected:
                        selectedStatus ==
                            GymStatus.no,
                        onTap: () {
                          setState(() {
                            selectedStatus =
                                GymStatus.no;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),

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
                        icon:
                        const Icon(Icons.arrow_forward),
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

  /////////////////////////////////////////////////////////////
  /// OPTION BUTTON
  /////////////////////////////////////////////////////////////

  Widget _statusButton({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor:
        isSelected ? Colors.red : Colors.grey[900],
      ),
    );
  }
}