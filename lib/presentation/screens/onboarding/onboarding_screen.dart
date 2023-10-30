// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:canal_olympia/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:canal_olympia/presentation/screens/home/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/onboarding_background.png"),
              fit: BoxFit.cover),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(0, 255, 255, 255),
                Color.fromARGB(143, 10, 20, 69),
                Color.fromARGB(255, 10, 20, 69),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const Spacer(
                flex: 7,
              ),
              DefaultButton(
                label: "Commencez",
                onTap: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}