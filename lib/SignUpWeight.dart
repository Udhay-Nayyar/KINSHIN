import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/services/auth_service.dart';

class SignUpWeightGoalPage extends StatefulWidget {
  const SignUpWeightGoalPage({super.key});

  @override
  State<SignUpWeightGoalPage> createState() =>
      _SignUpWeightGoalPageState();
}

class _SignUpWeightGoalPageState
    extends State<SignUpWeightGoalPage> {

  final TextEditingController _currentWeightController =
  TextEditingController();

  final TextEditingController _targetWeightController =
  TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _currentWeightController.dispose();
    _targetWeightController.dispose();
    super.dispose();
  }

  /////////////////////////////////////////////////////////////
  /// FINAL STEP → REGISTER USER + SEND OTP
  /////////////////////////////////////////////////////////////

  Future<void> _finish() async {

    final args =
    ModalRoute.of(context)?.settings.arguments as Map?;

    if (args == null || args["email"] == null) {
      _showSnack("Signup data missing");
      return;
    }

    final currentText =
    _currentWeightController.text.trim();

    final targetText =
    _targetWeightController.text.trim();

    if (currentText.isEmpty || targetText.isEmpty) {
      _showSnack("Please fill both fields");
      return;
    }

    final current = double.tryParse(currentText);
    final target = double.tryParse(targetText);

    if (current == null || current < 30 || current > 300) {
      _showSnack("Enter valid current weight (30-300kg)");
      return;
    }

    if (target == null || target < 30 || target > 300) {
      _showSnack("Enter valid target weight (30-300kg)");
      return;
    }

    if (current == target) {
      _showSnack("Target must differ from current");
      return;
    }

    setState(() => _isLoading = true);

    try {

      final response = await AuthService.registerUser(
        data: {
          ...args,
          "currentWeight": current,
          "targetWeight": target,
        },
      );

      print("REGISTER RESPONSE: $response");

      if (!mounted) return;

      if (response["success"] == true) {

        /////////////////////////////////////////////////////////////
        /// GO TO OTP SCREEN
        /////////////////////////////////////////////////////////////

        Navigator.pushNamed(
          context,
          '/otp',
          arguments: {
            "email": args["email"],
          },
        );

      } else {

        _showSnack(
          response["message"] ?? "Registration failed",
        );
      }

    } catch (e) {
      _showSnack("Network error");
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
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
                  "SET YOUR TARGET",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),

                const SizedBox(height: 40),

                _weightField(
                  label: "CURRENT WEIGHT",
                  controller: _currentWeightController,
                  icon: Icons.scale,
                ),

                const SizedBox(height: 25),

                _weightField(
                  label: "TARGET WEIGHT",
                  controller: _targetWeightController,
                  icon: Icons.flag,
                ),

                const SizedBox(height: 50),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed:
                    _isLoading ? null : _finish,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text("FINISH"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////

  Widget _weightField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          cursorColor: Colors.red,
          style:
          const TextStyle(color: Colors.white),
          keyboardType:
          const TextInputType.numberWithOptions(
              decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'^\d*\.?\d{0,1}'),
            ),
          ],
          decoration: InputDecoration(
            prefixIcon:
            Icon(icon, color: Colors.white),
            suffixText: "kg",
            enabledBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(12),
              borderSide:
              const BorderSide(
                  color: Colors.white24),
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
      ],
    );
  }
}