import 'package:flutter/material.dart';
import 'Setting.dart';
import 'Training.Dart.dart';
import 'UserMainPage.dart' hide DashboardPage;
import 'IntroSplash.dart';
import 'SignUp.dart';
import 'SignUpAge.dart';
import 'SignUpCommitmentLevel.dart';
import 'SignUpExperience.dart';
import 'SignUpGender.dart';
import 'SignUpGymAvilable.dart';
import 'SignUpHeight.dart';
import 'SignUpUserName.dart';
// import 'dashboard_page.dart'; // adjust name if needed
import 'SignUpWeight.dart';
import 'DashBoard.dart';
import 'WelcomeSplash.dart';
import 'entringOtp.dart';
import 'login.dart';
// import 'otp_screen.dart'; // adjust if needed
// import 'login_screen.dart'; // adjust if needed

void main() {
  runApp(const MyApp());
}

///////////////////////////////////////////////////////////////
/// ROOT APP
///////////////////////////////////////////////////////////////

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      /////////////////////////////////////////////////////////
      /// GLOBAL THEME (VERY IMPORTANT)
      /////////////////////////////////////////////////////////

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
      ),

      /////////////////////////////////////////////////////////
      /// START SCREEN
      /////////////////////////////////////////////////////////

      initialRoute: '/',

      /////////////////////////////////////////////////////////
      /// ROUTES (PROFESSIONAL NAVIGATION)
      /////////////////////////////////////////////////////////

        routes: {

          /// ENTRY
          '/': (context) => const IntroSplash(),

          '/login': (context) => const LoginScreen(),

          '/signup': (context) => const SignUpPage(),

          '/otp': (context) => const OtpScreen(),

          //////////////////////////////////////
          /// SIGNUP FLOW
          //////////////////////////////////////

          '/signup-gym': (context) => const SignUpGymStatusPage(),
          '/signup-gender': (context) => const SignUpGenderPage(),
          '/signup-name': (context) => const SignUpNamePage(),
          '/signup-height': (context) => const SignUpHeightPage(),
          '/signup-goal': (context) => const SignUpGoalPage(),
          '/signup-experience': (context) => const SignUpExperiencePage(),
          '/signup-age': (context) => const SignUpAgePage(),
          '/signup-weight': (context) => const SignUpWeightGoalPage(),

          //////////////////////////////////////
          /// POST OTP
          //////////////////////////////////////

          '/welcome': (context) => const WelcomeSplash(),

          //////////////////////////////////////
          /// APP SHELL
          //////////////////////////////////////

          '/main': (context) => const UserMainPage(),
          // '/training': (context) => const TrainingPage(),
          // '/settings': (context) => const SettingsPage(),
          // '/history': (context) => const HistoryPage(), // create later if needed


        },


    );
  }
}



