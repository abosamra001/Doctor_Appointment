import 'package:advanced2/core/di/dependency_injection.dart';
import 'package:advanced2/core/routing/routes.dart';
import 'package:advanced2/features/home/ui/home_screen.dart';
import 'package:advanced2/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced2/features/login/ui/screens/login_screen.dart';
import 'package:advanced2/features/onboarding/onboarding_screen.dart';
import 'package:advanced2/features/signup/logic/cubit/signup_cubit.dart';
import 'package:advanced2/features/signup/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No page route for ${routeSettings.name}"),
            ),
          ),
        );
    }
  }
}
