import 'package:flutter/material.dart';

enum GoalType {
  weekly,
  monthly,
}

class SignUpGoalPage extends StatefulWidget {
  const SignUpGoalPage({super.key});

  @override
  State<SignUpGoalPage> createState() =>
      _SignUpGoalPageState();
}

class _SignUpGoalPageState
    extends State<SignUpGoalPage> {

  GoalType? selectedGoal;

  /////////////////////////////////////////////////////////////
  /// NEXT STEP
  /////////////////////////////////////////////////////////////

  void _finishStep() {

    if (selectedGoal == null) {
      _showSnack("Please select a goal");
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

    final goalValue =
    selectedGoal == GoalType.weekly
        ? "weekly"
        : "monthly";

    /////////////////////////////////////////////////////////////
    /// PASS EVERYTHING FORWARD CLEANLY
    /////////////////////////////////////////////////////////////

    Navigator.pushNamed(
      context,
      '/signup-experience',
      arguments: {
        ...args,
        "goal": goalValue,
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
                  "MONTHLY OR WEEKLY GOAL?",
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
                      child: _goalButton(
                        label: "Weekly",
                        icon: Icons.trending_up,
                        isSelected:
                        selectedGoal ==
                            GoalType.weekly,
                        onTap: () {
                          setState(() {
                            selectedGoal =
                                GoalType.weekly;
                          });
                        },
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: _goalButton(
                        label: "Monthly",
                        icon: Icons.calendar_month,
                        isSelected:
                        selectedGoal ==
                            GoalType.monthly,
                        onTap: () {
                          setState(() {
                            selectedGoal =
                                GoalType.monthly;
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
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Prev"),
                        style: ElevatedButton.styleFrom(
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
                        onPressed: _finishStep,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Next"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
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

  /////////////////////////////////////////////////////////////
  /// GOAL BUTTON
  /////////////////////////////////////////////////////////////

  Widget _goalButton({
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