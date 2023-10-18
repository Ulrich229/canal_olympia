import 'package:canal_olympia/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:canal_olympia/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

onGenerateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case '/':
      builder = (BuildContext _) => const SplashScreen();
      break;
    case '/onboarding':
      builder = (BuildContext _) => const OnboardingScreen();
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
