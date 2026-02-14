import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark warrior theme
      appBar: AppBar(
        title: const Text("SETTINGS", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          // --- SECTION: ACCOUNT ---
          _sectionHeader("ACCOUNT"),
          _settingsTile(Icons.person_outline, "Profile Settings", "Edit name, age, and weight"),
          _settingsTile(Icons.notifications_none, "Notifications", "Workout reminders and alerts"),

          const SizedBox(height: 20),

          // --- SECTION: PREFERENCES ---
          _sectionHeader("PREFERENCES"),
          _settingsTile(Icons.language, "Language", "English (Warrior Mode)"),
          _settingsTile(Icons.dark_mode, "Theme", "Dark Red (Default)"),

          const SizedBox(height: 20),

          // --- SECTION: SUPPORT ---
          _sectionHeader("SUPPORT"),
          _settingsTile(Icons.help_outline, "Help Center", "FAQs and guides"),
          _settingsTile(Icons.info_outline, "About Gym Land", "Version 1.0.0"),

          const SizedBox(height: 40),

          // --- LOGOUT BUTTON ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Logic to return to Welcome or Login screen
                print("Logging out...");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                "LOGOUT",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Section Headers
  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white38, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.2),
      ),
    );
  }

  // Helper for Settings Rows
  Widget _settingsTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 12)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
      onTap: () {
        print("Clicked on $title");
      },
    );
  }
}