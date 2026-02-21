import 'package:flutter/material.dart';

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
      theme: ThemeData.dark(),

      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

///////////////////////////////////////////////////////////////
/// LOGIN PAGE
///////////////////////////////////////////////////////////////

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _login(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _login(context),
          child: const Text("LOGIN"),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// HOME PAGE
///////////////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToSettings(BuildContext context) {
    Navigator.pushNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _goToSettings(context),
          child: const Text("GO TO SETTINGS"),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// SETTINGS PAGE
///////////////////////////////////////////////////////////////

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  /////////////////////////////////////////////////////////////
  /// LOGOUT (REMOVES ALL ROUTES)
  /////////////////////////////////////////////////////////////

  void _logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
          (route) => false,
    );
  }

  /////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // 👈 BACK BUTTON
        title: const Text(
          "SETTINGS",
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [

          const SettingsSection(title: "ACCOUNT"),

          const SettingsTile(
            icon: Icons.person_outline,
            title: "Profile Settings",
            subtitle: "Edit name, age, and weight",
          ),

          const SettingsTile(
            icon: Icons.notifications_none,
            title: "Notifications",
            subtitle: "Workout reminders and alerts",
          ),

          const SizedBox(height: 20),

          const SettingsSection(title: "PREFERENCES"),

          const SettingsTile(
            icon: Icons.language,
            title: "Language",
            subtitle: "English (Warrior Mode)",
          ),

          const SettingsTile(
            icon: Icons.dark_mode,
            title: "Theme",
            subtitle: "Dark Red (Default)",
          ),

          const SizedBox(height: 20),

          const SettingsSection(title: "SUPPORT"),

          const SettingsTile(
            icon: Icons.help_outline,
            title: "Help Center",
            subtitle: "FAQs and guides",
          ),

          const SettingsTile(
            icon: Icons.info_outline,
            title: "About Gym Land",
            subtitle: "Version 1.0.0",
          ),

          const SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "LOGOUT",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// SECTION HEADER
///////////////////////////////////////////////////////////////

class SettingsSection extends StatelessWidget {
  final String title;

  const SettingsSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 13,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// SETTINGS TILE
///////////////////////////////////////////////////////////////

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),

      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),

      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 12,
        ),
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white24,
        size: 16,
      ),

      onTap: () {
        debugPrint("Clicked on $title");
      },
    );
  }
}