import 'package:flutter/material.dart';
import 'DashBoard.dart';
import 'Training.Dart.dart';
import 'Setting.dart';

///////////////////////////////////////////////////////////////
/// MAIN APP SHELL (BOTTOM NAV + NESTED NAVIGATORS)
///////////////////////////////////////////////////////////////

class UserMainPage extends StatefulWidget {
  const UserMainPage({super.key});

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {

  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  /////////////////////////////////////////////////////////////
  /// HANDLE BACK BUTTON (ANDROID SYSTEM BACK)
  /////////////////////////////////////////////////////////////

  Future<bool> _onWillPop() async {
    final NavigatorState currentNavigator =
    _navigatorKeys[_currentIndex].currentState!;

    if (currentNavigator.canPop()) {
      currentNavigator.pop();
      return false;
    }

    return true;
  }

  /////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,

      child: Scaffold(
        body: Stack(
          children: [

            _buildOffstageNavigator(0, const DashboardPage()),
            _buildOffstageNavigator(1, const TrainingPage()),
            _buildOffstageNavigator(2, const SettingsPage()),

          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (_currentIndex == index) {
              _navigatorKeys[index]
                  .currentState!
                  .popUntil((route) => route.isFirst);
            } else {
              setState(() => _currentIndex = index);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: "Training",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////
  /// BUILD NESTED NAVIGATOR
  /////////////////////////////////////////////////////////////

  Widget _buildOffstageNavigator(int index, Widget child) {
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (_) => child,
          );
        },
      ),
    );
  }
}