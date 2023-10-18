import 'dart:async';
import 'dart:developer';

import 'package:canal_olympia/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = "/";
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double scale;
  @override
  void initState() {
    scale = 0;
    init();
    super.initState();
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    await Future.doWhile(() async {
      log('Started with $scale');
      if (scale < 15) {
        setState(() {
          scale += 1;
        });
      } else {
        setState(() {
          scale += 10;
        });
      }
      await Future.delayed(
        const Duration(microseconds: 100),
      );
      if (scale > 1000) {
        log('Finished with $scale');
        return false;
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedScale(
                scale: scale,
                duration: const Duration(
                  milliseconds: 1000,
                ),
                onEnd: () async {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    OnboardingScreen.routeName,
                    (route) => false,
                  );
                },
                curve: Curves.easeIn,
                child: Container(
                  height: 1.h,
                  width: 1.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 188, 0, 46),
                  ),
                ),
              ),
              Image.asset(
                "assets/images/logo.png",
                width: 65.w,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
