import 'package:canal_olympia/business_logic/cubits/home_filter/home_filter_cubit.dart';
import 'package:canal_olympia/data/models/movie.dart';
import 'package:canal_olympia/presentation/screens/home/home_screen.dart';
import 'package:canal_olympia/presentation/screens/movie_details/movie_details_screen.dart';
import 'package:canal_olympia/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:canal_olympia/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onGenerateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case '/':
      builder = (BuildContext _) => const SplashScreen();
      break;
    case '/onboarding':
      builder = (BuildContext _) => const OnboardingScreen();
      break;
    case '/home':
      builder = (BuildContext _) => BlocProvider(
            create: (context) => HomeFilterCubit(),
            child: const HomeScreen(),
          );
      break;
    case '/movie-details':
      final Movie movie = settings.arguments as Movie;
      builder = (BuildContext _) => MovieDetailsScreen(movie: movie);
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
