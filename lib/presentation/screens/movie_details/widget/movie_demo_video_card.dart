import 'dart:ui';

import 'package:canal_olympia/data/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MovieDemoVideoCard extends StatelessWidget {
  const MovieDemoVideoCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(movie.corver),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 15,
            color: Colors.white.withOpacity(0.1),
          ),
          BoxShadow(
            offset: const Offset(-5, 0),
            blurRadius: 15,
            color: Colors.white.withOpacity(0.1),
          ),
          BoxShadow(
            offset: const Offset(-5, -5),
            blurRadius: 15,
            color: Colors.white.withOpacity(0.1),
          ),
        ],
      ),
      child: Container(
        height: 25.h,
        width: 90.w,
        padding: EdgeInsets.symmetric(
          horizontal: 90.w / 2 - 17.sp,
          vertical: 25.h / 2 - 17.sp,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17.sp),
          clipBehavior: Clip.antiAlias,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Padding(
              padding: EdgeInsets.all(3.w),
              child: Container(
                height: 5.w,
                width: 5.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/icons/Play.png"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
