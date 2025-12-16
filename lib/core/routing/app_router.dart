import 'package:advanced2/core/routing/routes.dart';
import 'package:advanced2/features/login/ui/screens/login_screen.dart';
import 'package:advanced2/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Center(child: Text("No page route for ${routeSettings.name}"))),
        );
    }
  }
}
