import 'package:canal_olympia/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Canal Olympia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Sora",
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(
              16,
              86,
              196,
              1,
            ),
          ),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => onGenerateRoute(settings),
      );
    });
  }
}
