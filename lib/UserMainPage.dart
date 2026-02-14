import 'package:flutter/material.dart';

import 'DashBoard.dart';
import 'Setting.dart';
import 'Training.Dart.dart';

class Usermainpage extends StatelessWidget {
  const Usermainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The dark slate/green background from your sketch
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // --- TRAY 1: HEADER ---
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Pro Tips (Creativity) Box
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 2),
                      color: Colors.yellow.withOpacity(0.05),
                    ),
                    child: const Text(
                      "PRO TIPS",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1
                      ),
                    ),
                  ),
                  // Account/Profile Section
                  Row(
                    children: [
                      const Text(
                        "WARRIOR", // Your name "Udhay" or warrior label
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          // This pushes the DashboardPage onto the screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DashboardPage()),
                          );
                        },
                        // This ensures the ripple effect matches your container's shape
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(Icons.person, color: Colors.white, size: 30),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Divider(color: Colors.white24, thickness: 1, indent: 20, endIndent: 20),

            // --- TRAY 2: TITLE ---
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "TODAY'S MISSIONS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                ),
              ),
            ),

            const Divider(color: Colors.white24, thickness: 1, indent: 20, endIndent: 20),
            const SizedBox(height: 40), // Shifted Tray 3 down as requested

            // --- TRAY 3: TASK GRID (3 per row) ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _taskBox("DONE", Colors.blue),
                    _taskBox("DONE", Colors.blue),
                    _taskBox("DONE", Colors.blue),
                    _taskBox("DONE", Colors.blue),
                    _taskBox("DONE", Colors.blue),
                    _taskBox("START", Colors.green, isBold: true),
                    _taskBox("LOCKED", Colors.red.withOpacity(0.5)),
                    _taskBox("LOCKED", Colors.red.withOpacity(0.5)),
                    _taskBox("LOCKED", Colors.red.withOpacity(0.5)),
                  ],
                ),
              ),
            ),

            // --- TRAY 4: BOTTOM NAVIGATION ---
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.black, // Dark footer for the nav
                border: Border(top: BorderSide(color: Colors.red, width: 3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOption(context, "INTAKE", Icons.local_fire_department, 0),
                  _buildOption(context, "TRAINING", Icons.fitness_center, 1),
                  _buildOption(context, "HISTORY", Icons.history, 2),
                  _buildOption(context, "SETTINGS", Icons.settings, 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for the Grid Boxes
  Widget _taskBox(String text, Color color, {bool isBold = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2.5),
        color: isBold ? color.withOpacity(0.2) : Colors.black45,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 1.0
          ),
        ),
      ),
    );
  }

  // Helper for Bottom Nav Options
  Widget _buildOption(BuildContext context, String label, IconData icon, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.white, size: 28),
          onPressed: () {
            // Determine which page to go to based on the index
            switch (index) {
              case 0:
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const IntakePage()));
                break;
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingPage()));
                break;
              case 2:
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryPage()));
                break;
              case 3:
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                break;
            }
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}