import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  /// Controller for backend usage
  final TextEditingController _identifierController =
  TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _identifierController.dispose(); // prevents memory leak
    super.dispose();
  }

  void _requestOtp() {
    final identifier = _identifierController.text.trim();

    if (identifier.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email or phone")),
      );
      return;
    }

    /// TEMP — until API arrives
    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
      debugPrint("OTP requested for: $identifier");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      /// prevents overflow when keyboard opens
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "剣心",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "HEART OF THE SWORD",
                  style: TextStyle(
                    color: Colors.red,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 60),

                TextField(
                  controller: _identifierController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    hintText: "Email / Phone Number",
                    hintStyle:
                    const TextStyle(color: Colors.white70),

                    prefixIcon:
                    const Icon(Icons.email, color: Colors.white),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(color: Colors.white),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _requestOtp,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: _isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text(
                      "GET OTP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
