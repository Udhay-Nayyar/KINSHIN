import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Added HYBRID to the list
    final List<Map<String, dynamic>> categories = [
      {"name": "POWERLIFTING", "icon": Icons.fitness_center},
      {"name": "BODYBUILDING", "icon": Icons.accessibility_new},
      {"name": "ATHLETE", "icon": Icons.directions_run},
      {"name": "HYBRID", "icon": Icons.cyclone}, // New Hybrid option
      {"name": "GENERAL", "icon": Icons.reorder},
      {"name": "FAT LOSS", "icon": Icons.whatshot},
      {"name": "WEIGHT GAIN", "icon": Icons.add_chart},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("CHOOSE YOUR PATH", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigation logic here
              print("Navigating to ${categories[index]['name']}");
            },
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Icon(categories[index]['icon'], color: Colors.red, size: 30),
                  const SizedBox(width: 20),
                  Text(
                    categories[index]['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, color: Colors.red, size: 18),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}