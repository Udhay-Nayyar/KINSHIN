import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////
/// MODEL (BACKEND READY)
///////////////////////////////////////////////////////////////

class Mission {
  final int id;
  final String status;
  /// expected from backend:
  /// completed | active | locked

  Mission({
    required this.id,
    required this.status,
  });
}

///////////////////////////////////////////////////////////////
/// DASHBOARD
///////////////////////////////////////////////////////////////

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  /////////////////////////////////////////////////////////////
  /// TEMP DATA (DELETE WHEN API COMES)
  /////////////////////////////////////////////////////////////

  List<Mission> get missions => List.generate(
    9,
        (index) {
      if (index < 5) {
        return Mission(id: index, status: "completed");
      } else if (index == 5) {
        return Mission(id: index, status: "active");
      } else {
        return Mission(id: index, status: "locked");
      }
    },
  );

  /////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
          const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              ////////////////////////////////////////////////////
              /// HEADER
              ////////////////////////////////////////////////////

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.yellow),
                    ),
                    child: const Text(
                      "PRO TIPS",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),

                  const Row(
                    children: [
                      Text("Account",
                          style: TextStyle(
                              color:
                              Colors.white)),
                      SizedBox(width: 8),
                      Icon(Icons.person,
                          color: Colors.white)
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Divider(color: Colors.white24),

              ////////////////////////////////////////////////////
              /// TITLE
              ////////////////////////////////////////////////////

              const SizedBox(height: 15),

              const Center(
                child: Text(
                  "Today's Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight:
                    FontWeight.w600,
                    fontStyle:
                    FontStyle.italic,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Divider(color: Colors.white24),

              const SizedBox(height: 30),

              ////////////////////////////////////////////////////
              /// MISSION GRID (BACKEND DRIVEN)
              ////////////////////////////////////////////////////

              GridView.builder(
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),

                itemCount: missions.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),

                itemBuilder: (context, index) {

                  final mission =
                  missions[index];

                  return _missionCard(mission);
                },
              ),

              ////////////////////////////////////////////////////
              /// GALLERY
              ////////////////////////////////////////////////////

              const SizedBox(height: 40),

              const Divider(color: Colors.white24),

              const SizedBox(height: 20),

              const Text(
                "Personal Gallery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {

                  /// Later:
                  /// open gallery screen

                },
                child: Container(
                  height: 130,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(
                        18),
                    border: Border.all(
                        color: Colors.red,
                        width: 2),
                  ),

                  child: const Center(
                    child: Text(
                      "Transformation Journey",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////
  /// MISSION CARD
  /////////////////////////////////////////////////////////////

  Widget _missionCard(Mission mission) {

    Color borderColor;
    String text;

    switch (mission.status) {

      case "completed":
        borderColor = Colors.blue;
        text = "Completed";
        break;

      case "active":
        borderColor = Colors.green;
        text = "START";
        break;

      default:
        borderColor = Colors.red;
        text = "LOCK";
    }

    return Container(
      decoration: BoxDecoration(
        border:
        Border.all(color: borderColor, width: 2),
        borderRadius:
        BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: borderColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
