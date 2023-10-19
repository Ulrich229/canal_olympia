import 'package:canal_olympia/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 1.2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 17, 75),
                          Color.fromARGB(255, 188, 0, 46),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Commencez",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
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
