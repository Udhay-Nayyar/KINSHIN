import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_first_app/services/auth_service.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController _otpController =
  TextEditingController();

  bool _isLoading = false;
  bool _isResending = false;

  late String email;

  /////////////////////////////////////////////////////////////
  /// GET EMAIL FROM PREVIOUS SCREEN
  /////////////////////////////////////////////////////////////

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
    ModalRoute.of(context)?.settings.arguments as Map?;

    email = args?["email"] ?? "";
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  /////////////////////////////////////////////////////////////
  /// VERIFY OTP
  /////////////////////////////////////////////////////////////

  Future<void> _verifyOtp() async {

    final otp = _otpController.text.trim();

    if (otp.length != 6) {
      _showSnack("Enter valid 6-digit OTP");
      return;
    }

    if (email.isEmpty) {
      _showSnack("Email missing");
      return;
    }

    setState(() => _isLoading = true);

    try {

      final response = await AuthService.verifyOtp(
        email: email,
        otp: otp,
      );

      if (!mounted) return;

      if (response["success"] == true) {

        /////////////////////////////////////////////////////////////
        /// SAVE LOGIN STATE (FOR SPLASH)
        /////////////////////////////////////////////////////////////

        final prefs =
        await SharedPreferences.getInstance();

        await prefs.setBool("isLoggedIn", true);

        /////////////////////////////////////////////////////////////
        /// GO TO MAIN PAGE
        /////////////////////////////////////////////////////////////

        Navigator.pushNamedAndRemoveUntil(
          context,
          '/main',
              (route) => false,
        );

      } else {

        _showSnack(
          response["message"] ?? "Invalid OTP",
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
  /// RESEND OTP
  /////////////////////////////////////////////////////////////

  Future<void> _resendOtp() async {

    if (email.isEmpty) return;

    setState(() => _isResending = true);

    try {

      final response =
      await AuthService.sendOtp(email: email);

      if (!mounted) return;

      if (response["success"] == true) {
        _showSnack("OTP sent again to $email");
      } else {
        _showSnack(
          response["message"] ?? "Failed to resend OTP",
        );
      }

    } catch (e) {
      _showSnack("Network error");
    } finally {
      if (mounted) {
        setState(() => _isResending = false);
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
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 32),

          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [

              const Text(
                "ENTER OTP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "OTP sent to $email",
                style: const TextStyle(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              ///////////////////////////////////////////////////////
              /// OTP FIELD
              ///////////////////////////////////////////////////////

              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 8,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: "",
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(
                        color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(
                        color: Colors.red,
                        width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ///////////////////////////////////////////////////////
              /// VERIFY BUTTON
              ///////////////////////////////////////////////////////

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed:
                  _isLoading ? null : _verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : const Text("VERIFY OTP"),
                ),
              ),

              const SizedBox(height: 20),

              ///////////////////////////////////////////////////////
              /// RESEND BUTTON
              ///////////////////////////////////////////////////////

              TextButton(
                onPressed:
                _isResending ? null : _resendOtp,
                child: _isResending
                    ? const CircularProgressIndicator(
                  color: Colors.red,
                )
                    : const Text(
                  "Resend OTP",
                  style: TextStyle(
                      color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}