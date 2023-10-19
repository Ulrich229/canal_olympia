import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:canal_olympia/presentation/screens/home/widgets/blur_app_bar.dart';
import 'package:canal_olympia/presentation/screens/home/widgets/home_filter_selector.dart';
import 'package:canal_olympia/presentation/screens/home/widgets/movie_carrousel.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 20, 69),
      extendBodyBehindAppBar: true,
      appBar: BlurAppBar(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                "assets/images/mini_logo.png",
                height: kToolbarHeight / 2,
              ),
              const Spacer(),
              AppBarChoiceButton(
                iconPath: "assets/icons/Location.png",
                label: "Bessengue",
                onTap: () {},
              ),
              SizedBox(
                width: 5.w,
              ),
              AppBarChoiceButton(
                iconPath: "assets/icons/Language.png",
                label: "Eng",
                onTap: () {},
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.5.h,
                      horizontal: 3.w,
                    ),
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
                      "Log in",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2.h),
              const HomeFilterSelector(),
              SizedBox(height: 2.h),
              const MovieCarrousel(),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarChoiceButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;
  const AppBarChoiceButton({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            height: kTextTabBarHeight / 2.3,
          ),
          SizedBox(
            width: 1.w,
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
