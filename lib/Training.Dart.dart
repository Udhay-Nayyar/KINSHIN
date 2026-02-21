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

      initialRoute: '/home',

      routes: {

        '/home': (context) => const HomePage(),

        '/training': (context) => const TrainingPage(),

        '/training-powerlifting': (context) =>
        const TrainingDetailPage(title: "POWERLIFTING"),

        '/training-bodybuilding': (context) =>
        const TrainingDetailPage(title: "BODYBUILDING"),

        '/training-athlete': (context) =>
        const TrainingDetailPage(title: "ATHLETE"),

        '/training-hybrid': (context) =>
        const TrainingDetailPage(title: "HYBRID"),

        '/training-general': (context) =>
        const TrainingDetailPage(title: "GENERAL"),

        '/training-fatloss': (context) =>
        const TrainingDetailPage(title: "FAT LOSS"),

        '/training-weightgain': (context) =>
        const TrainingDetailPage(title: "WEIGHT GAIN"),
      },
    );
  }
}

///////////////////////////////////////////////////////////////
/// HOME PAGE
///////////////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToTraining(BuildContext context) {
    Navigator.pushNamed(context, '/training');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HOME")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _goToTraining(context),
          child: const Text("GO TO TRAINING"),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// TRAINING MODEL
///////////////////////////////////////////////////////////////

class TrainingCategory {
  final String name;
  final IconData icon;
  final String route;

  const TrainingCategory({
    required this.name,
    required this.icon,
    required this.route,
  });
}

///////////////////////////////////////////////////////////////
/// TRAINING PAGE
///////////////////////////////////////////////////////////////

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  static const List<TrainingCategory> categories = [

    TrainingCategory(
      name: "POWERLIFTING",
      icon: Icons.fitness_center,
      route: '/training-powerlifting',
    ),

    TrainingCategory(
      name: "BODYBUILDING",
      icon: Icons.accessibility_new,
      route: '/training-bodybuilding',
    ),

    TrainingCategory(
      name: "ATHLETE",
      icon: Icons.directions_run,
      route: '/training-athlete',
    ),

    TrainingCategory(
      name: "HYBRID",
      icon: Icons.cyclone,
      route: '/training-hybrid',
    ),

    TrainingCategory(
      name: "GENERAL",
      icon: Icons.reorder,
      route: '/training-general',
    ),

    TrainingCategory(
      name: "FAT LOSS",
      icon: Icons.whatshot,
      route: '/training-fatloss',
    ),

    TrainingCategory(
      name: "WEIGHT GAIN",
      icon: Icons.add_chart,
      route: '/training-weightgain',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true, // 👈 BACK BUTTON
        title: const Text(
          "CHOOSE YOUR PATH",
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        separatorBuilder: (_, __) =>
        const SizedBox(height: 15),

        itemBuilder: (context, index) {

          final category = categories[index];

          return Material(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),

            child: InkWell(
              borderRadius: BorderRadius.circular(12),

              onTap: () {
                Navigator.pushNamed(
                  context,
                  category.route,
                );
              },

              child: Container(
                height: 80,

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius:
                  BorderRadius.circular(12),
                ),

                child: Row(
                  children: [

                    const SizedBox(width: 20),

                    Icon(
                      category.icon,
                      color: Colors.red,
                      size: 30,
                    ),

                    const SizedBox(width: 20),

                    Text(
                      category.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),

                    const Spacer(),

                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.red,
                      size: 18,
                    ),

                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// TRAINING DETAIL PAGE
///////////////////////////////////////////////////////////////

class TrainingDetailPage extends StatelessWidget {
  final String title;

  const TrainingDetailPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // 👈 BACK BUTTON
        title: Text(title),
      ),
      body: Center(
        child: Text(
          "$title WORKOUT PLAN",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}