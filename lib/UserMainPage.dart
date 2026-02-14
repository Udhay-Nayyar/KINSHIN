import 'package:flutter/material.dart';

class Usermainpage extends StatelessWidget {
  const Usermainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The background color from your sketch (Dark Slate/Green)
      backgroundColor: const Color(0xFF0B1B18),
      body: SafeArea(
        child: Column(
          children: [
            // --- TRAY 1: HEADER ---
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Creativity Box
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 2),
                    ),
                    child: const Text(
                      "Pro Tips",
                      style: TextStyle(color: Colors.yellow, fontSize: 18),
                    ),
                  ),
                  // RC and Profile Icon
                  Row(
                    children: [
                      const Text("Account", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(Icons.person, color: Colors.white, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
            const Divider(color: Colors.white, thickness: 1),

            // --- TRAY 2: TITLE ---
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Today Task",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive', // To match your handwritten style
                ),
              ),
            ),


            Container(child: const Divider(color: Colors.white, thickness: 1)),


            const SizedBox(height: 60),
            // --- TRAY 3: TASK GRID (3 per row) ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _taskBox("Completed", Colors.blue),
                    _taskBox("Completed", Colors.blue),
                    _taskBox("Completed", Colors.blue),
                    _taskBox("Completed", Colors.blue),
                    _taskBox("Completed", Colors.blue),
                    _taskBox("START", Colors.green, isBold: true),
                    _taskBox("LOCK", Colors.red),
                    _taskBox("LOCK", Colors.red),
                  ],
                ),
              ),
            ),

            // --- TRAY 4: BOTTOM NAVIGATION ---
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.red, width: 2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navItem("Water\nfood intake?"),
                  _navItem("Training Mode"),
                  _navItem("History"),
                  _navItem("Settings"),
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
        border: Border.all(color: color, width: 2),
        color: isBold ? color.withOpacity(0.1) : Colors.transparent,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // Helper for Bottom Nav
  Widget _navItem(String text) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}