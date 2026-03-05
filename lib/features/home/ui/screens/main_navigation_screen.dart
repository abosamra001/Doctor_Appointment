import 'package:advanced2/core/widgets/screen_wrapper.dart';
import 'package:advanced2/features/home/ui/screens/home_screen.dart';
import 'package:advanced2/features/home/ui/screens/user_profile_screen.dart';
import 'package:advanced2/features/home/ui/widgets/home_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [const HomeScreen(), const UserProfileScreen()],
        ),
        bottomNavigationBar: HomeNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
