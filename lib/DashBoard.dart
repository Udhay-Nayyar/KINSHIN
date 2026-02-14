import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark green background from your sketch
      appBar: AppBar(
        title: const Text("DASHBOARD", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECTION 1: BASIC INFO ---
            const Text("Basic Info", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person_outline, color: Colors.red, size: 50),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _infoLine(),
                            const SizedBox(height: 8),
                            _infoLine(),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.white24),
                  const SizedBox(height: 10),
                  // Grid-like info lines
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [_infoLine(width: 60), const SizedBox(height: 5), _infoLine(width: 60)]),
                      Column(children: [_infoLine(width: 60), const SizedBox(height: 5), _infoLine(width: 60)]),
                      Column(children: [_infoLine(width: 40), const SizedBox(height: 5), _infoLine(width: 40)]),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Buttons: EDIT and SAVE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _actionButton("EDIT"),
                      _actionButton("SAVE"),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Divider(color: Colors.white24),

            // --- SECTION 2: PERSONAL GALLERY ---
            const Text("Personal Gallery", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Transformation Journey",
                  style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(color: Colors.white24),

            // --- SECTION 3: MENU LIST ---
            _menuItem(Icons.feedback_outlined, "Feedback"),
            _menuItem(Icons.chat_bubble_outline, "Feedback", hasArrow: true),
            _menuItem(Icons.share_outlined, "Social Media", hasArrow: true),
            _menuItem(Icons.star_border, "Rating", hasArrow: true),
          ],
        ),
      ),
    );
  }

  // Helper for those white lines in your sketch
  Widget _infoLine({double width = 100}) {
    return Container(
      height: 2,
      width: width,
      color: Colors.white38,
    );
  }

  // Helper for Edit/Save buttons
  Widget _actionButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  // Helper for the bottom list items
  Widget _menuItem(IconData icon, String title, {bool hasArrow = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.red),
          const SizedBox(width: 20),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const Spacer(),
          if (hasArrow) const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ],
      ),
    );
  }
}