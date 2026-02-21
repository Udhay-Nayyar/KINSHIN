import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {

  static const String baseUrl =
      "https://gymapp-9ag1.onrender.com/api/auth";

  /////////////////////////////////////////////////////////////
  /// REGISTER USER (SIGNUP + SEND OTP)
  /////////////////////////////////////////////////////////////

  static Future<Map<String, dynamic>> registerUser({
    required Map<String, dynamic> data,
  }) async {

    try {

      final response = await http.post(
        Uri.parse("$baseUrl/signup"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );

      final decoded = jsonDecode(response.body);

      print("REGISTER STATUS: ${response.statusCode}");
      print("REGISTER BODY: $decoded");

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {

        return {
          "success": true,
          "message": decoded["message"] ?? "Success",
          "data": decoded,
        };

      } else {

        return {
          "success": false,
          "message":
          decoded["message"] ?? "Registration failed",
        };
      }

    } catch (e) {

      print("REGISTER ERROR: $e");

      return {
        "success": false,
        "message": "Network error",
      };
    }
  }

  /////////////////////////////////////////////////////////////
  /// RESEND OTP
  /////////////////////////////////////////////////////////////

  static Future<Map<String, dynamic>> sendOtp({
    required String email,
  }) async {

    try {

      final response = await http.post(
        Uri.parse("$baseUrl/resend-otp"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
        }),
      );

      final decoded = jsonDecode(response.body);

      print("RESEND STATUS: ${response.statusCode}");
      print("RESEND BODY: $decoded");

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {

        return {
          "success": true,
          "message": decoded["message"] ?? "OTP sent",
          "data": decoded,
        };

      } else {

        return {
          "success": false,
          "message":
          decoded["message"] ?? "Failed to resend OTP",
        };
      }

    } catch (e) {

      print("RESEND ERROR: $e");

      return {
        "success": false,
        "message": "Network error",
      };
    }
  }

  /////////////////////////////////////////////////////////////
  /// VERIFY OTP
  /////////////////////////////////////////////////////////////

  static Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otp,
  }) async {

    try {

      final response = await http.post(
        Uri.parse("$baseUrl/verify-otp"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "otp": otp,
        }),
      );

      final decoded = jsonDecode(response.body);

      print("VERIFY STATUS: ${response.statusCode}");
      print("VERIFY BODY: $decoded");

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {

        return {
          "success": true,
          "message":
          decoded["message"] ?? "OTP verified",
          "data": decoded,
        };

      } else {

        return {
          "success": false,
          "message":
          decoded["message"] ??
              "OTP verification failed",
        };
      }

    } catch (e) {

      print("VERIFY ERROR: $e");

      return {
        "success": false,
        "message": "Network error",
      };
    }
  }
}